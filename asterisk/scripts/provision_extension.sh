#!/bin/bash
EXT=$1
PASS=$2
CONF_FILE="/etc/asterisk/pjsip.conf"

if [ -z "$EXT" ] || [ -z "$PASS" ]; then
    echo "Uso: $0 <extension> <password>"
    exit 1
fi

# Añadir endpoint, auth y aor
cat >> $CONF_FILE << EOF

[$EXT]
type=endpoint
context=default
disallow=all
allow=ulaw
auth=${EXT}-auth
aors=${EXT}

[${EXT}-auth]
type=auth
auth_type=userpass
password=$PASS

[$EXT]
type=aor
max_contacts=1
EOF

# Recargar módulo SIP
asterisk -rx "module reload chan_pjsip.so"
echo "Extensión $EXT agregada y recargada"