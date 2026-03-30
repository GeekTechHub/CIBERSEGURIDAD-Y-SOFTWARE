# 🛰️ Security-Serv: Advanced Intel & Forensic Suite (Sentinel V1.5)

Este repositorio contiene herramientas de auditoría de red de alto impacto diseñadas para entornos de **Ciberseguridad y Peritaje Informático**. El script **Sentinel** automatiza la recolección de telemetría, el análisis de latencia y la detección de superficies de ataque en entornos Linux/Chromebook.

## 🛠️ 1. Reparación y Preparación del Entorno

Antes de ejecutar las herramientas, es fundamental asegurar que el gestor de paquetes de Linux esté operativo y que las dependencias de cálculo existan en el sistema.

### Reparar el Gestor de Paquetes (Apt)
Si experimentas errores de repositorios (como `antigravity`), ejecuta:
```bash
# Limpiar listas corruptas y actualizar ignorando errores de repositorios externos
sudo rm -rf /var/lib/apt/lists/*
sudo apt update --allow-insecure-repositories

# Instalar dependencias críticas
sudo apt install bc jq traceroute -y

🚀 Instalación y Uso
#Clonar y entrar al directorio:

Bash
git clone [https://github.com/GeekTechHub/CIBERSEGURIDAD-Y-SOFTWARE.git](https://github.com/GeekTechHub/CIBERSEGURIDAD-Y-SOFTWARE.git)
cd CIBERSEGURIDAD-Y-SOFTWARE

#Asignar permisos de ejecución:

Bash
chmod +x sentinel.sh

#Ejecutar la auditoría:

Bash
sudo ./sentinel.sh

#Para visualizar los resultados de la investigación, utiliza el comando cat o less:

Bash
cat sentinel_intel_report.md
