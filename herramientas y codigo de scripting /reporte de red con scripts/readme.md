# 🛡️ Network Diagnostic & Automation Script (Bash)

Este repositorio contiene un script de automatización desarrollado para el entorno de **Linux (Debian/Crostini)** en Chromebook. El objetivo es simplificar la creación de entornos de trabajo y la recolección de diagnósticos de red iniciales, útiles en tareas de administración de sistemas y ciberseguridad.

## 🚀 Funcionalidades

- **Automatización de Directorios**: Crea una estructura de carpetas jerárquica de forma segura con `mkdir -p`.
- **Diagnóstico de Red**: Ejecuta un escaneo de interfaces, rutas de enlace y conectividad.
- **Redirección de Datos**: Genera un archivo de reporte físico (`diagnostico_red.txt`) para auditoría.
- **Interfaz Visual**: Implementa códigos de colores ANSI para una mejor experiencia en la terminal.

## 🛠️ Explicación Técnica del Script

El script `setup_proyecto.sh` se desglosa de la siguiente manera:

### 1. Cabecera y Variables
- `#!/bin/bash`: El **Shebang** que define el intérprete de comandos.
- `GREEN`, `BLUE`, `NC`: Variables que almacenan secuencias de escape ANSI para dar formato y color a la salida de la terminal.

### 2. Lógica de Archivos
- `mkdir -p ~/proyectos/ejemplo-proyecto`: Crea el árbol de directorios. La bandera `-p` evita errores si la carpeta ya existe.
- `cd`: Cambia el contexto de ejecución a la nueva ruta.

### 3. Recolección de Evidencias (Bloque de Redirección)
El uso de `{ ... } > diagnostico_red.txt` permite agrupar múltiples comandos y enviar su salida a un solo archivo:
- `$(date)`: Comando embebido para el sellado de tiempo (Timestamping).
- `ip addr show | grep "inet "`: Filtrado de información de red para mostrar solo direcciones IP activas.
- `ping -c 2 google.com`: Prueba de latencia y pérdida de paquetes.

### 4. Finalización
- `$(pwd)`: Muestra la ruta absoluta del trabajo realizado.
- `ls -lh`: Lista el archivo generado con tamaños legibles para humanos (KB/MB).

## 💻 Cómo utilizarlo

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/GeekTechHub/CIBERSEGURIDAD-Y-SOFTWARE.git](https://github.com/GeekTechHub/CIBERSEGURIDAD-Y-SOFTWARE.git)
   cd CIBERSEGURIDAD-Y-SOFTWARE


2. **Dar permisos de ejecución:**

terminal Bash
chmod +x setup_proyecto.sh
3. **ejecutar el script:**

terminal Bash
./setup_proyecto.sh

**Ver el reporte generado:**

terminal Bash
cat ~/proyectos/ejemplo-proyecto/diagnostico_red.txt
Desarrollado por SecurityServ | Cybersecurity Technician & Senior Web Engineer




   
