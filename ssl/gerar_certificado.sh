#!/bin/bash

# Nome do domínio
DOMAIN="coelho.tools"
WILDCARD="*.coelho.tools"

# Gerar chave privada
openssl genrsa -out $DOMAIN.key 2048

# Criar o arquivo de configuração para wildcard
cat > wildcard.conf <<EOF
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req

[req_distinguished_name]
commonName = $WILDCARD

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = $WILDCARD
DNS.2 = $DOMAIN
EOF

# Gerar CSR sem interação
openssl req -new -key $DOMAIN.key -out $DOMAIN.csr -config wildcard.conf -subj "/CN=$WILDCARD"

# Gerar certificado autoassinado
openssl x509 -req -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt -days 1825 -extensions v3_req -extfile wildcard.conf

# Limpar arquivos temporários
rm -f wildcard.conf $DOMAIN.csr

echo "Certificado gerado:"
echo "  - Chave privada: $DOMAIN.key"
echo "  - Certificado: $DOMAIN.crt"
