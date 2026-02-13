# JSON Server para Flutter MPC - Con Rutas Personalizadas

Este es un servidor JSON mock avanzado para la aplicación Flutter MPC con rutas personalizadas y datos organizados en módulos separados.

## 📁 Estructura de Datos

Los datos están organizados en carpetas separadas para mejor mantenimiento:

```
json-server/
├── data/
│   ├── orders/orders.json          # Datos de órdenes
│   ├── employees/employees.json    # Datos de empleados  
│   ├── cashtoday/cashtoday.json    # Datos de efectivo diario
│   └── servicepoints/servicepoints.json # Datos de puntos de servicio
├── routes/routes.json              # Configuración de rutas personalizadas
├── server.js                       # Servidor personalizado con rutas custom
└── utils.js                        # Utilidades para manejo de datos
```

## 🚀 Instalación

1. Navega a la carpeta json-server:
```bash
cd json-server
```

2. Instala las dependencias:
```bash
npm install
```

## 💻 Comandos Disponibles

### Servidor Personalizado (Recomendado)
```bash
npm start          # Servidor con rutas personalizadas
npm run start:dev  # Igual que start (para desarrollo)
```

### Servidor Simple
```bash
npm run start:simple  # Servidor básico json-server
npm run start:routes  # Servidor con rutas pero sin custom endpoints
```

El servidor estará disponible en `http://localhost:3000`

## 🌐 Endpoints Disponibles

### Endpoints Estándar (JSON Server)
- `GET /employees` - Obtener todos los empleados
- `GET /employees/:id` - Obtener un empleado específico  
- `POST /employees` - Crear un nuevo empleado
- `PUT /employees/:id` - Actualizar un empleado
- `DELETE /employees/:id` - Eliminar un empleado

- `GET /orders` - Obtener todas las órdenes
- `GET /orders/:id` - Obtener una orden específica
- `POST /orders` - Crear una nueva orden
- `PUT /orders/:id` - Actualizar una orden
- `DELETE /orders/:id` - Eliminar una orden

- `GET /servicepoints` - Obtener todos los puntos de servicio
- `GET /servicepoints/:id` - Obtener un punto de servicio específico
- `POST /servicepoints` - Crear un nuevo punto de servicio
- `PUT /servicepoints/:id` - Actualizar un punto de servicio
- `DELETE /servicepoints/:id` - Eliminar un punto de servicio

- `GET /cashtoday` - Obtener todos los registros de efectivo
- `GET /cashtoday/:id` - Obtener un registro específico
- `POST /cashtoday` - Crear un nuevo registro
- `PUT /cashtoday/:id` - Actualizar un registro
- `DELETE /cashtoday/:id` - Eliminar un registro

### 🎯 Endpoints Personalizados (API Custom)

#### Sistema
- `GET /api/health` - Estado del servidor

#### Búsqueda de Empleados
- `GET /api/search/employees` - Búsqueda avanzada de empleados
  - Parámetros: `q`, `department`, `active`, `servicePointId`
  - Ejemplo: `/api/search/employees?q=juan&department=Ventas&active=true`

#### Órdenes Especializadas
- `GET /api/orders/by-employee/:employeeId` - Órdenes por empleado
- `GET /api/orders/summary` - Resumen de órdenes por estado

#### Efectivo por Punto de Servicio
- `GET /api/cashtoday/by-servicepoint/:servicePointId` - Efectivo por punto de servicio
  - Parámetros opcionales: `date`
  - Ejemplo: `/api/cashtoday/by-servicepoint/1?date=2024-11-25`

### 🔗 Rutas con Alias (API Versioning)
- `/api/orders/*` → `/orders/*`
- `/api/employees/*` → `/employees/*` 
- `/api/cashtoday/*` → `/cashtoday/*`
- `/api/servicepoints/*` → `/servicepoints/*`
- `/api/v1/*` → Igual que `/api/*`

## Filtros y Consultas

JSON Server soporta filtros automáticos:

### Ejemplos de filtros
```bash
# Empleados activos
GET /employees?active=true

# Órdenes por estado
GET /orders?status=pending

# Órdenes por empleado
GET /orders?employeeId=1

# Puntos de servicio activos
GET /servicePoints?active=true

# Cash Today por punto de servicio
GET /cashToday?servicePointId=1
```

### Paginación
```bash
# Obtener 10 empleados por página, página 1
GET /employees?_page=1&_limit=10
```

### Ordenamiento
```bash
# Ordenar empleados por nombre
GET /employees?_sort=name&_order=asc

# Ordenar órdenes por fecha (descendente)
GET /orders?_sort=date&_order=desc
```

### Búsqueda
```bash
# Buscar empleados por nombre
GET /employees?name_like=Juan

# Buscar empleados por email
GET /employees?email_like=@company.com
```

## 🛠️ Utilidades de Datos

El archivo `utils.js` proporciona herramientas para manejar los datos:

```bash
# Crear backup de todos los datos
node utils.js backup

# Sincronizar datos modulares con db.json principal
node utils.js sync

# Ver datos combinados
node utils.js combine

# Restaurar desde backup
node utils.js restore backup-2024-11-25T10-30-00-000Z.json
```

## 📱 Configuración para Flutter

```dart
class ApiConfig {
  // Para desarrollo local
  static const String baseUrl = 'http://localhost:3000';
  
  // Para desarrollo en dispositivo físico (reemplaza con tu IP)  
  static const String baseUrlDevice = 'http://192.168.1.100:3000';
  
  // Endpoints personalizados
  static const String searchEmployees = '/api/search/employees';
  static const String ordersByEmployee = '/api/orders/by-employee';
  static const String cashByServicePoint = '/api/cashtoday/by-servicepoint';
  static const String ordersummary = '/api/orders/summary';
  static const String health = '/api/health';
}
```

### Ejemplos de Uso en Flutter

```dart
// Buscar empleados
final response = await http.get(
  Uri.parse('${ApiConfig.baseUrl}${ApiConfig.searchEmployees}?q=juan&active=true')
);

// Obtener órdenes de un empleado
final orders = await http.get(
  Uri.parse('${ApiConfig.baseUrl}${ApiConfig.ordersByEmployee}/1')
);

// Efectivo por punto de servicio
final cash = await http.get(
  Uri.parse('${ApiConfig.baseUrl}${ApiConfig.cashByServicePoint}/1?date=2024-11-25')
);
```

## ✨ Características Principales

- **📁 Datos Modulares**: Cada módulo tiene su propio archivo JSON
- **🔄 Auto-sync**: Los cambios se guardan automáticamente en archivos separados
- **🎯 Rutas Personalizadas**: Endpoints especializados para casos de uso específicos  
- **🔍 Búsqueda Avanzada**: Filtros múltiples y búsqueda de texto
- **📊 APIs de Resumen**: Endpoints para dashboards y reportes
- **💾 Sistema de Backup**: Respaldo y restauración de datos
- **🌐 CORS Habilitado**: Listo para desarrollo web/móvil
- **⚡ Performance**: Carga rápida con datos organizados

## 🚨 Notas Importantes

- Los cambios se guardan en archivos JSON separados por módulo
- El servidor personalizado mantiene sincronización automática
- Para producción, considera migrar a una base de datos real
- Los backups se crean automáticamente con timestamp
- Soporte completo para operaciones CRUD en todos los módulos