# 🕵️‍♂️ Sherlock-OSINT: Intelligence & Forensic Research Tool

Sherlock-OSINT es una herramienta avanzada de recolección de evidencias digitales (OSINT) y peritaje informático. Está diseñada para automatizar el reconocimiento de infraestructura, la atribución geográfica y el análisis de seguridad de objetivos remotos, generando informes técnicos detallados en formato Markdown para su uso en auditorías legales o de ciberseguridad.

## ⚙️ Desglose Técnico del Código

El script opera bajo un flujo de ejecución lineal blindado con manejo de dependencias y variables de entorno dinámicas:

1. Definición de Interfaz y Variables: El script inicia cargando códigos de escape ANSI para proporcionar una respuesta visual categorizada por colores (Cyan para procesos, Amarillo para alertas, Verde para éxito). La variable REPORT se genera dinámicamente usando $(date +%H%M), lo que asegura que cada ejecución cree un archivo de evidencia único e inalterable por sesiones previas.

2. Atribución Geográfica e Inteligencia de Red: Utiliza el comando curl para realizar una petición asíncrona a una API de geolocalización. El parámetro fields=66846719 filtra específicamente datos de ISP, país, ciudad, coordenadas y, crucialmente, la bandera de proxy/VPN. El comando jq procesa esta respuesta para extraer atributos individuales que definen el origen físico del tráfico.

3. Análisis de Capa de Transporte (Latencia): Se ejecuta un ping controlado (3 paquetes) para obtener el Round Trip Time (RTT). Mediante el uso de awk y filtros de texto, se extrae el valor promedio. La lógica de control utiliza el procesador matemático bc -l para realizar comparaciones decimales precisas, permitiendo al script disparar alertas si la latencia sugiere que el objetivo está operando tras redes de anonimato como TOR.

4. Fingerprinting de Servicios: Se realiza una captura de cabeceras HTTP mediante curl -s -I. Esta técnica de "Banner Grabbing" intenta forzar al servidor objetivo a revelar su firma de software (Server Banner). Si el servidor está protegido por un firewall o balanceador, el script maneja la ausencia de datos mediante una validación condicional para reportar el servicio como "Invisible" en lugar de dar un error.

5. Trazado de Ruta Forense (Traceroute): El comando traceroute mapea el camino físico que siguen los paquetes. Al limitar el escaneo a 20 saltos y filtrar los últimos 5 resultados mediante tail, el script se enfoca en los nodos finales de la red, que son los que realmente identifican la infraestructura del host investigado.

## 🚀 Guía de Ejecución y Aplicación General

Para implementar esta herramienta en un flujo de trabajo profesional, se deben seguir los siguientes protocolos de operación:

Preparación del Entorno: Es obligatorio contar con las utilidades jq, traceroute, curl y bc instaladas en el sistema Linux. Estas herramientas permiten el procesamiento de datos y el análisis de red avanzado que el script requiere.

Protocolo de Lanzamiento: Una vez asignados los permisos de ejecución con chmod +x, el analista debe ejecutar el script y proporcionar el objetivo. El script acepta tanto direcciones IP (IPv4) como nombres de dominio (FQDN). Durante la ejecución, el analista no debe interrumpir el proceso de traceroute, ya que es la fase que consume más tiempo pero la que ofrece la evidencia de ruta más sólida.

Aplicación Profesional: Esta herramienta se utiliza principalmente en tres escenarios:
1. Auditoría Preventiva: Para verificar qué información es pública sobre los servidores propios de la empresa.
2. Peritaje Forense: Para rastrear el origen de un ataque detectado en los logs del servidor.
3. Investigación OSINT: Para validar si un dominio sospechoso está vinculado a infraestructuras de hosting maliciosas o países de alto riesgo.

## 🧐 Interpretación General de Hallazgos

Un informe generado por Sherlock-OSINT debe interpretarse bajo los siguientes criterios de análisis pericial:

Identificación del Host: Si el Proveedor (ISP) es un servicio de Hosting (como AWS, DigitalOcean o Azure), es probable que el objetivo sea un servidor profesional o un bot. Si el ISP es una empresa de telecomunicaciones local (Claro, Altice, etc.), el objetivo es probablemente un usuario final doméstico.

Indicadores de Evasión: El campo Proxy/VPN/Hosting es el indicador más crítico. Un valor positivo en este campo, sumado a una latencia superior a 200ms, es una prueba técnica de que el sujeto está ocultando su ubicación real mediante capas de cifrado o túneles internacionales.

Seguridad del Servidor: En el fingerprinting, la presencia de versiones específicas de software (ej. Apache 2.4.41) permite al perito buscar vulnerabilidades conocidas (CVEs) asociadas a esa versión. Si el servidor aparece como "Invisible", indica la presencia de un Web Application Firewall (WAF) que protege el sitio.

Análisis de Saltos (Traceroute): Los saltos que muestran asteriscos (* * *) indican nodos que descartan paquetes de diagnóstico para evitar el mapeo de red. Los saltos finales revelan la "puerta de entrada" del centro de datos donde se aloja el objetivo, lo cual es fundamental para emitir citaciones legales o solicitudes de información al proveedor de infraestructura.

---
Documentación de Nivel Senior para SecurityServ Ops.
