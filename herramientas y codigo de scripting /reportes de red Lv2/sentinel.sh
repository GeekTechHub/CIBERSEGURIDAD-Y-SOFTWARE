#!/bin/bash

# --- COLORES DE LA INTERFAZ ---
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YEL='\033[1;33m'
MAG='\033[1;35m'
NC='\033[0m'

REPORT="sentinel_intel_report.md"

echo -e "${MAG}
#######################################################
#            SECURITY-SERV: SENTINEL V1.5             #
#        OPERACIONES TÁCTICAS - INTEL REPORT          #
#######################################################${NC}"

{
    echo "# 🛡️ Sentinel Intelligence Report"
    echo "## 📅 Fecha: $(date)"
    echo "---"

    # 1. LATENCIA Y CALIDAD DE CONEXIÓN (Performance)
    echo -e "${CYan}[*] Analizando latencia y rapidez...${NC}"
    echo "### ⚡ Análisis de Rendimiento"
    
    # Ping de alta precisión para medir Jitter (variación de latencia)
    PING_DATA=$(ping -c 5 8.8.8.8)
    LATENCIA_AVG=$(echo "$PING_DATA" | tail -1 | awk -F '/' '{print $5}')
    LOSS=$(echo "$PING_DATA" | grep -oP '\d+(?=% packet loss)')

    echo "- **Latencia Promedio:** ${LATENCIA_AVG}ms"
    echo "- **Pérdida de Paquetes:** ${LOSS}%"

    # Evaluación de Salud
    if (( $(echo "$LATENCIA_AVG > 100" | bc -l) )); then
        echo "> ⚠️ **ALERTA DE RED:** Latencia crítica. Posible congestión o saturación de banda."
    elif [ "$LOSS" -ne 0 ]; then
        echo "> ❌ **FALLO DETECTADO:** Interferencia en la señal o cables dañados (Pérdida de datos)."
    else
        echo "> ✅ **ESTADO:** Conexión estable y óptima."
    fi

    # 2. ESCANEO DE SERVICIOS Y PUERTOS (Hacking Ético)
    echo -e "${CYAN}[*] Ejecutando escaneo de puertos avanzado...${NC}"
    echo -e "\n### 🔍 Auditoría de Puertos Localhost"
    
    # Escaneamos los puertos más peligrosos
    for port in 21 22 23 25 53 80 443 3306 8080; do
        (timeout 0.1 bash -c "echo > /dev/tcp/127.0.0.1/$port") 2>/dev/null && \
        echo "- 🚨 Puerto $port (ABIERTO) - **Nivel de Riesgo: CRÍTICO**" || \
        echo "- Puerto $port: Cerrado"
    done

    # 3. TOPOLOGÍA Y VECINOS (Discovery)
    echo -e "${CYAN}[*] Mapeando topología de red...${NC}"
    echo -e "\n### 🌐 Dispositivos en tu Vecindad"
    ip neighbor show | grep -v "FAILED" | awk '{print "- IP: " $1 " | MAC: " $5 " | Estado: " $6}'
    
    # 4. DNS Y SEGURIDAD
    echo -e "\n### 🔐 Seguridad de DNS"
    DNS_SRV=$(grep "nameserver" /etc/resolv.conf | awk '{print $2}')
    echo "- **Servidor DNS Actual:** $DNS_SRV"
    if [[ "$DNS_SRV" == "8.8.8.8" || "$DNS_SRV" == "1.1.1.1" ]]; then
        echo "- **Estado:** Usando DNS Público Seguro ✅"
    else
        echo "- **Estado:** DNS Local/Privado (Posible monitoreo del ISP) ⚠️"
    fi

} > $REPORT

echo -e "${GREEN}[+] Auditoría completada. Inteligencia guardada en: $REPORT${NC}"
