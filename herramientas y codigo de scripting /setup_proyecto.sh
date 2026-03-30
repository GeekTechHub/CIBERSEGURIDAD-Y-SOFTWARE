#!/bin/bash

# --- CONFIGURACIÓN DE COLORES ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

echo -e "${BLUE}>>> Iniciando Entorno de Trabajo para SecurityServ <<<${NC}"

# 1. CREACIÓN DE DIRECTORIOS
echo -e "${GREEN}[+] Creando estructura de carpetas...${NC}"
mkdir -p ~/proyectos/ejemplo-proyecto
cd ~/proyectos/ejemplo-proyecto

# 2. GENERACIÓN DE REPORTE DE RED
echo -e "${GREEN}[+] Generando diagnóstico de red...${NC}"
{
    echo "REPORTE DE RED - $(date)"
    echo "---------------------------"
    echo "INTERFACES:"
    ip addr show | grep "inet "
    echo -e "\nPUERTA DE ENLACE (GATEWAY):"
    ip route | grep default
    echo -e "\nPRUEBA DE CONECTIVIDAD:"
    ping -c 2 google.com
} > diagnostico_red.txt

# 3. LISTAR RESULTADOS
echo -e "${BLUE}>>> Tarea completada con éxito <<<${NC}"
echo "Archivos creados en: $(pwd)"
ls -lh
