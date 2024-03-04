#!/bin/bash

# Verificam daca am dat numarul de parametrii corespunzatori
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <DB_USER> <DB_PASSWORD> <DB_HOST> <DB_NAME>"
    exit 1
fi

# Credentialele pentru baza de date
DB_USER="$1"
DB_PASSWORD="$2"
DB_HOST="$3"
DB_NAME="$4"

# Aici vom face un insert in tabela "Sistem" cu datele HW ale sistemului meu
# Urmand ca ulterior sa updatez doar tabelele Resurse si Retea
producator=$(curl -s "http://localhost:8080/get-furnizor")
model=$(curl -s "http://localhost:8080/get-nume")
procesor=$(curl -s "http://localhost:8080/get-procesor")
serial=$(curl -s "http://localhost:8080/get-serial")

mysql -u "$DB_USER" -p"$DB_PASSWORD" -h "$DB_HOST" "$DB_NAME" <<EOF
INSERT INTO tblSistem(numarSerial, modelProcesor, producatorSistem, modelSistem) VALUES ($serial, '$procesor', '$producator', '$model');
EOF

# Voi prelua intr-o variabila si valoarea ce va fi ca referinta pentru cheia straina
# in cele doua tabele si o transmit script-ului de inserare

FKEY=$(mysql -u "$DB_USER" -p"$DB_PASSWORD" -h "$DB_HOST" "$DB_NAME" \
    -se "SELECT idSistem FROM tblSistem WHERE numarSerial=$serial AND producatorSistem='$producator'")

echo "$FKEY"

# while true; do
#     # Executam scriptul de inserare in cele doua tabele
#     ./insert_db.sh "$DB_USER" "$DB_PASSWORD" "$DB_HOST" "$DB_NAME" "$FKEY"

#     # Asteptam 5 minute
#     sleep 300
# done