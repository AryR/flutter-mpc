const jsonServer = require('json-server')
const path = require('path')
const fs = require('fs')

// Crear el servidor
const server = jsonServer.create()
const middlewares = jsonServer.defaults()

// Usar middlewares por defecto (logger, static, cors y no-cache)
server.use(middlewares)

// Función para cargar datos de un módulo específico
function loadModuleData(moduleName) {
    const filePath = path.join(__dirname, 'data', moduleName, `${moduleName}.json`)
    if (fs.existsSync(filePath)) {
        const data = fs.readFileSync(filePath, 'utf8')
        return JSON.parse(data)
    }
    return {}
}

// Función para guardar datos de un módulo específico
function saveModuleData(moduleName, data) {
    const filePath = path.join(__dirname, 'data', moduleName, `${moduleName}.json`)
    const moduleData = {}
    moduleData[moduleName] = data[moduleName] || []
    fs.writeFileSync(filePath, JSON.stringify(moduleData, null, 2))
}

// Combinar todos los datos de los módulos
function getCombinedData() {
    const modules = ['orders', 'employees', 'cashtoday', 'servicepoints']
    let combinedData = {}

    modules.forEach(module => {
        const moduleData = loadModuleData(module)
        combinedData = { ...combinedData, ...moduleData }
    })

    return combinedData
}

// Middleware personalizado para manejar escrituras
server.use(jsonServer.bodyParser)
server.use((req, res, next) => {
    if (req.method === 'POST' || req.method === 'PUT' || req.method === 'PATCH' || req.method === 'DELETE') {
        // Determinar el módulo basado en la ruta
        const pathParts = req.path.split('/')
        const moduleName = pathParts[1]

        if (['orders', 'employees', 'cashtoday', 'servicepoints'].includes(moduleName)) {
            // Interceptar la respuesta para guardar en archivo específico
            const originalJson = res.json
            res.json = function (data) {
                // Guardar en el archivo del módulo específico
                const currentData = getCombinedData()
                saveModuleData(moduleName, currentData)

                return originalJson.call(this, data)
            }
        }
    }
    next()
})

// Rutas personalizadas
server.get('/api/health', (req, res) => {
    res.jsonp({
        status: 'OK',
        message: 'Flutter MPC JSON Server is running',
        timestamp: new Date().toISOString(),
        modules: ['orders', 'employees', 'cashtoday', 'servicepoints']
    })
})

// Ruta para búsqueda de empleados
server.get('/api/search/employees', (req, res) => {
    const { q, department, active, servicePointId } = req.query
    const employeesData = loadModuleData('employees')
    let employees = employeesData.employees || []

    // Filtrar por query de búsqueda
    if (q) {
        employees = employees.filter(emp =>
            emp.name.toLowerCase().includes(q.toLowerCase()) ||
            emp.email.toLowerCase().includes(q.toLowerCase()) ||
            emp.position.toLowerCase().includes(q.toLowerCase())
        )
    }

    // Filtrar por departamento
    if (department) {
        employees = employees.filter(emp => emp.department === department)
    }

    // Filtrar por estado activo
    if (active !== undefined) {
        employees = employees.filter(emp => emp.active.toString() === active)
    }

    // Filtrar por punto de servicio
    if (servicePointId) {
        employees = employees.filter(emp => emp.servicePointId.toString() === servicePointId)
    }

    res.jsonp({
        data: employees,
        total: employees.length,
        query: req.query
    })
})

// Ruta para órdenes por empleado
server.get('/api/orders/', (req, res) => {
    const ordersData = loadModuleData('orders')
    const orders = ordersData.orders || []

    res.jsonp({
        orders
    })
})

// Ruta para efectivo del día por punto de servicio
server.get('/api/cashtoday/by-servicepoint/:servicePointId', (req, res) => {
    const servicePointId = parseInt(req.params.servicePointId)
    const { date } = req.query
    const cashData = loadModuleData('cashtoday')
    let cashRecords = cashData.cashToday || []

    // Filtrar por punto de servicio
    cashRecords = cashRecords.filter(record => record.servicePointId === servicePointId)

    // Filtrar por fecha si se proporciona
    if (date) {
        cashRecords = cashRecords.filter(record => record.date === date)
    }

    res.jsonp({
        servicePointId,
        date: date || 'all',
        records: cashRecords,
        total: cashRecords.length
    })
})

// Usar el router de json-server con los datos combinados
const router = jsonServer.router(getCombinedData())
server.use(router)

// Configurar el puerto
const port = process.env.PORT || 3000
server.listen(port, () => {
    console.log(`🚀 Flutter MPC JSON Server is running on port ${port}`)
})