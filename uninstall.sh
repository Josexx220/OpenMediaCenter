#!/bin/sh

set -eu

APP_NAME="Open Media Center"
INSTALL_DIR="/opt/openmediacenter"
BIN_LINK="/usr/local/bin/omc"

echo "========================================="
echo " Desinstalador de Open Media Center"
echo "========================================="

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: ejecutá este desinstalador como root."
    echo "Usá: sudo ./uninstall.sh"
    exit 1
fi

if [ ! -d "$INSTALL_DIR" ]; then
    echo "Open Media Center no está instalado."
    exit 0
fi

echo "Eliminando archivos..."

rm -f "$BIN_LINK"
rm -rf "$INSTALL_DIR"

echo
echo "Open Media Center fue desinstalado correctamente."
