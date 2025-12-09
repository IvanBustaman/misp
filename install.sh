#!/bin/bash
# install.sh - Instalador Automatizado de MISP Core
# Basado en el instalador oficial de MISP Project

set -e
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}🦠 Iniciando Instalación de MISP...${NC}"
echo -e "${YELLOW}⚠️  ADVERTENCIA: MISP requiere una instalación limpia.${NC}"
echo -e "${YELLOW}⚠️  Este proceso tomará entre 15 y 30 minutos.${NC}"
echo ""

# 1. Preparar el entorno
echo -e "${GREEN}📦 Actualizando repositorios...${NC}"
sudo apt-get update

# 2. Descargar el instalador oficial
echo -e "${GREEN}⬇️ Descargando instalador maestro de MISP...${NC}"
# Descargamos el script oficial a la carpeta temporal
wget --no-check-certificate -O /tmp/INSTALL.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh
chmod +x /tmp/INSTALL.sh

# 3. Ejecutar instalación (Opción -c para Core, sin interfaz gráfica innecesaria)
echo -e "${GREEN}🚀 Ejecutando instalación...${NC}"
echo "-------------------------------------------------------"
echo "El instalador te hará algunas preguntas de configuración."
echo "Si no sabes qué responder, presiona ENTER para usar los valores por defecto."
echo "-------------------------------------------------------"
sleep 3

# Ejecutamos el instalador oficial
# -c = Instalar Core (LAMP + MISP + Modules)
bash /tmp/INSTALL.sh -c

echo ""
echo -e "${GREEN}✅ Instalación de MISP Finalizada.${NC}"
echo "Por favor, anota las credenciales de admin que aparecieron arriba."