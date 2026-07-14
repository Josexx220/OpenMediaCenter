#!/bin/sh

set -eu

APP_NAME="OpenMediaCenter"
INSTALL_DIR="/opt/openmediacenter"
BIN_LINK="/usr/local/bin/omc"

echo "========================================="
echo " Instalador de Open Media Center"
echo "========================================="

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: ejecutá este instalador como root."
    echo "Usá: sudo ./install.sh"
    exit 1
fi

if [ ! -f "./VERSION" ] || [ ! -f "./bin/omc" ]; then
    echo "Error: ejecutá install.sh desde la carpeta del proyecto."
    exit 1
fi

VERSION="$(cat ./VERSION)"

echo "Versión: $VERSION"
echo "Destino: $INSTALL_DIR"

mkdir -p "$INSTALL_DIR"

cp -R assets bin config lib modules "$INSTALL_DIR/"
cp VERSION "$INSTALL_DIR/"
cp openmediacenter.sh "$INSTALL_DIR/"

mkdir -p "$INSTALL_DIR/playlists"
mkdir -p "$INSTALL_DIR/logs"
mkdir -p "$INSTALL_DIR/runtime"
mkdir -p "$INSTALL_DIR/backups"

chmod +x "$INSTALL_DIR/bin/omc"
chmod +x "$INSTALL_DIR/openmediacenter.sh"

cat > "$BIN_LINK" <<EOF
#!/bin/sh
exec "$INSTALL_DIR/bin/omc" "\$@"
EOF

chmod +x "$BIN_LINK"

echo
echo "Instalación completada."
echo "Ejecutá Open Media Center con:"
echo
echo "  omc"
echo
