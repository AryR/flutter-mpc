const fs = require('fs')
const path = require('path')

class DataManager {
    constructor() {
        this.dataDir = path.join(__dirname, 'data')
        this.modules = ['orders', 'employees', 'cashtoday', 'servicepoints']
    }

    // Cargar datos de un módulo específico
    loadModule(moduleName) {
        const filePath = path.join(this.dataDir, moduleName, `${moduleName}.json`)
        if (fs.existsSync(filePath)) {
            const data = fs.readFileSync(filePath, 'utf8')
            return JSON.parse(data)
        }
        return {}
    }

    // Guardar datos de un módulo específico
    saveModule(moduleName, data) {
        const filePath = path.join(this.dataDir, moduleName, `${moduleName}.json`)
        const dir = path.dirname(filePath)

        // Crear directorio si no existe
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true })
        }

        fs.writeFileSync(filePath, JSON.stringify(data, null, 2))
    }

    // Combinar todos los datos en un solo objeto
    combineAll() {
        let combinedData = {}

        this.modules.forEach(module => {
            const moduleData = this.loadModule(module)
            combinedData = { ...combinedData, ...moduleData }
        })

        return combinedData
    }

    // Crear backup de todos los datos
    createBackup() {
        const timestamp = new Date().toISOString().replace(/[:.]/g, '-')
        const backupDir = path.join(__dirname, 'backups')

        if (!fs.existsSync(backupDir)) {
            fs.mkdirSync(backupDir)
        }

        const backupData = this.combineAll()
        const backupFile = path.join(backupDir, `backup-${timestamp}.json`)

        fs.writeFileSync(backupFile, JSON.stringify(backupData, null, 2))
        console.log(`✅ Backup created: ${backupFile}`)

        return backupFile
    }

    // Restaurar desde backup
    restoreFromBackup(backupFile) {
        if (!fs.existsSync(backupFile)) {
            throw new Error(`Backup file not found: ${backupFile}`)
        }

        const backupData = JSON.parse(fs.readFileSync(backupFile, 'utf8'))

        // Guardar cada módulo por separado
        this.modules.forEach(module => {
            if (backupData[module]) {
                const moduleData = {}
                moduleData[module] = backupData[module]
                this.saveModule(module, moduleData)
                console.log(`✅ Restored ${module} data`)
            }
        })

        console.log('✅ All data restored from backup')
    }

    // Sincronizar con db.json principal
    syncWithMainDb() {
        const combinedData = this.combineAll()
        const mainDbPath = path.join(__dirname, 'db.json')

        fs.writeFileSync(mainDbPath, JSON.stringify(combinedData, null, 2))
        console.log('✅ Main db.json updated with modular data')
    }
}

// Exportar para uso en otros archivos
module.exports = DataManager

// Si se ejecuta directamente, mostrar opciones
if (require.main === module) {
    const args = process.argv.slice(2)
    const manager = new DataManager()

    switch (args[0]) {
        case 'backup':
            manager.createBackup()
            break

        case 'sync':
            manager.syncWithMainDb()
            break

        case 'combine':
            console.log(JSON.stringify(manager.combineAll(), null, 2))
            break

        case 'restore':
            if (args[1]) {
                manager.restoreFromBackup(args[1])
            } else {
                console.log('❌ Please provide backup file path')
            }
            break

        default:
            console.log('📊 Data Manager Usage:')
            console.log('  node utils.js backup    - Create backup of all data')
            console.log('  node utils.js sync      - Sync modular data to main db.json')
            console.log('  node utils.js combine   - Show combined data')
            console.log('  node utils.js restore <file> - Restore from backup')
            break
    }
}