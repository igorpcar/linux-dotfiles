#!/bin/bash

# Suponha que você está recebendo esse JSON de um comando como:
# weather_json=$(~/.config/waybar/scripts/algum_widget_clima)
# Para testes, vamos carregar de um arquivo:
weather_json=$(wttrbar --location sao_caetano_do_sul --nerd)

# Extrai a temperatura atual do campo "text" (após o ícone)
current_temp=$(echo "$weather_json" | jq -r '.text')

# Extrai a seção de "Today" do campo "tooltip"
today_block=$(echo "$weather_json" | jq -r '.tooltip' | grep -A1 -i '<b>Today' | tail -n1)

curl -s https://v2d.wttr.in/sao_caetano_do_sul -o ~/.config/waybar/scripts/forecast_output 2>/dev/null

# Extrai máxima e mínima (ícones 󰳡 e 󰳛)
max_temp=$(echo "$today_block" | grep -oP '󰳡 \K[0-9]+')
min_temp=$(echo "$today_block" | grep -oP '󰳛 \K[0-9]+')

# Exibe no formato: atual (min/max)
# echo "${current_temp}° (↓${min_temp} ↑${max_temp})"
echo "/ ${current_temp}° (<span color='#5dade2'>↓</span>${min_temp} <span color='#e74c3c'>↑</span>${max_temp})"
