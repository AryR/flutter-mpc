const path = require('path')

// Configuración del servidor
const config = {
    port: process.env.PORT || 3000,
    host: process.env.HOST || '0.0.0.0',

    // Configuración de módulos
    modules: {
        orders: {
            file: 'orders.json',
            directory: 'orders',
            endpoints: ['orders']
        },
        employees: {
            file: 'employees.json',
            directory: 'employees',
            endpoints: ['employees']
        },
        cashtoday: {
            file: 'cashtoday.json',
            directory: 'cashtoday',
            endpoints: ['cashtoday']
        },
        servicepoints: {
            file: 'servicepoints.json',
            directory: 'servicepoints',
            endpoints: ['servicepoints']
        }
    },

    // Rutas personalizadas
    customRoutes: {
        '/api/health': 'health',
        '/api/search/employees': 'searchEmployees',
        '/api/orders': 'orders',
        '/api/cashtoday/by-servicepoint/:servicePointId': 'cashByServicePoint',
    },

    // Configuración de CORS
    cors: {
        origin: true,
        credentials: true
    },

    // Configuración de logging
    logging: {
        enabled: true,
        level: 'info'
    }
}

module.exports = config