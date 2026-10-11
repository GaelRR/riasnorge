#!/bin/sh
# Cambia el número de WhatsApp en toda la web de una vez.
#
#   sh cambiar-numero.sh 34699123456 "+34 699 12 34 56"
#
#   1er argumento: el número para los enlaces wa.me — solo dígitos,
#                  con prefijo de país y SIN el signo +  (ej. 34699123456)
#   2º argumento:  cómo quieres que se vea escrito en la página
#                  (ej. "+34 699 12 34 56")

set -e

ENLACE="$1"
VISIBLE="$2"

if [ -z "$ENLACE" ] || [ -z "$VISIBLE" ]; then
  echo "Faltan datos."
  echo "Uso: sh cambiar-numero.sh 34699123456 \"+34 699 12 34 56\""
  exit 1
fi

case "$ENLACE" in
  *[!0-9]*)
    echo "El primer argumento solo puede tener dígitos (sin +, sin espacios)."
    echo "Ejemplo correcto: 34699123456"
    exit 1
    ;;
esac

for f in index.html equipo.html; do
  [ -f "$f" ] || continue
  # sed -i se escribe distinto en macOS y en Linux; así funciona en los dos
  sed "s|34600000000|$ENLACE|g; s|+34 600 00 00 00|$VISIBLE|g" "$f" > "$f.tmp"
  mv "$f.tmp" "$f"
  echo "Actualizado: $f"
done

echo
echo "Listo. Comprueba que no quede ningún rastro del número de ejemplo:"
grep -n "600 00 00 00\|34600000000" index.html equipo.html || echo "  (limpio)"
