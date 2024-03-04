#!/bin/bash

# # API URL
# API_URL="https://example.com/api/data"

# # GET request-ul pentru informatii si salvarea lor intr-un JSON
# curl -s "$API_URL" -o response.json

# # Formatarea JSON-ului
# formatted_data=$(jq '.' response.json)

# # Credentialele pentru baza de date
# DB_USER="$1"
# DB_PASSWORD="$2"
# DB_NAME="$3"
# DB_HOST="$4"
# FKEY="$5" # Pentru cheia straina

# # Ma conectez la baza de date si execut comenzile de inserare
# # Se foloseste conceptul de here-document: https://tldp.org/LDP/abs/html/here-docs.html

# mysql -u "$DB_USER" -p"$DB_PASSWORD" -h "$DB_HOST" "$DB_NAME" <<EOF
# INSERT INTO your_table_name (json_data_column) VALUES ('$formatted_data');
# EOF

# # Clean up
# rm response.json