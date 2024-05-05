#!/bin/bash

# URL para download do ExpressVPN
URL="https://www.expressvpn.works/clients/linux/expressvpn_3.68.0.2-1_amd64.deb"

# Nome do arquivo a ser baixado
FILENAME="expressvpn_3.68.0.2-1_amd64.deb"

# Diretório temporário para download e extração
TMP_DIR="/tmp/expressvpn_installation"

# Criar diretório temporário
mkdir -p $TMP_DIR

# Baixar o arquivo do ExpressVPN
wget -O "$TMP_DIR/$FILENAME" $URL

# Verificar se o download foi bem sucedido
if [ $? -ne 0 ]; then
    echo "Erro ao baixar o arquivo. Verifique a conexão com a internet ou a URL."
    exit 1
fi

# Descompactar o arquivo
sudo dpkg -i "$TMP_DIR/$FILENAME"

# Instalar o ExpressVPN
sudo apt-get install -f

# Limpar diretório temporário
rm -rf $TMP_DIR

echo "ExpressVPN foi instalado com sucesso!"
