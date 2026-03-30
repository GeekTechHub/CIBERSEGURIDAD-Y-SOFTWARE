#!/bin/bash

# --- INTERFAZ DE INVESTIGACIÓN DE ÉLITE ---
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YEL='\033[1;33m'
NC='\033[0m'

REPORT="investigacion_forense_$(date +%H%M).md"

echo -e "${CYAN}>>> SECURITY-SERV: INICIANDO EXTRACCIÓN DE EVIDENCIAS <<<${NC}"
read -p "Ingrese IP o Dominio del sospechoso: " TARGET

{
    echo "# 📑 Informe Pericial Forense"
    echo "## Caso: Investigación OSINT | Perito: Jean123"
    echo "---"

    # 1. RASTREO GEOGRÁFICO Y PROXY CHECK
    echo -e "${YEL}[*] Consultando bases de datos de inteligencia...${NC}"
    INTEL=$(curl -s [http://ip-api.com/json/$TARGET?fields=66846719](http://ip-api.com/json/$TARGET?fields=66846719))
    
    echo "### 🌍 1. Atribución Geográfica"
    echo "- **Ubicación:** $(echo $INTEL | jq -r '.city'), $(echo $INTEL | jq -r '.country')"
    echo "- **Proveedor (ISP):** $(echo $INTEL | jq -r '.isp')"
    echo "- **¿Es Proxy/VPN/Hosting?:** $(echo $INTEL | jq -r '.proxy')"
    
    # 2. ANALISIS DE LATENCIA
    echo -e "${YEL}[*] Calculando métricas de respuesta...${NC}"
    LATENCIA=$(ping -c 3 $TARGET | tail -1 | awk -F '/' '{print $5}')
    echo -e "\n### ⚡ 2. Análisis de Conexión"
    echo "- **Latencia Detectada:** ${LATENCIA}ms"
    
    if (( $(echo "$LATENCIA > 150" | bc -l) )); then
        echo "> ⚠️ **OBSERVACIÓN:** Latencia alta. Posible uso de red TOR o túnel internacional."
    fi

    # 3. HUELLA DIGITAL (Banner Grabbing)
    echo -e "${YEL}[*] Capturando huella del servidor...${NC}"
    echo -e "\n### 🖥️ 3. Fingerprinting de Servicios"
    BANNER=$(curl -s -I $TARGET --connect-timeout 5 | grep -i "Server")
    echo "- **Firma del Servidor:** ${BANNER:-"Protegido o Invisible"}"

    # 4. TRACEROUTE (Mapeo de Ruta de Escape)
    echo -e "${YEL}[*] Mapeando ruta de escape...${NC}"
    echo -e "\n### 🛣️ 4. Trazado de Ruta (Últimos saltos)"
    echo '```'
    traceroute -m 20 $TARGET | tail -n 5
    echo '```'

} > $REPORT

echo -e "${GREEN}[+] Evidencias guardadas en: $REPORT${NC}"
