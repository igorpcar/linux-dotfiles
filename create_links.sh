#!/bin/bash

# --- sync_dotfiles.sh (Versão Final Corrigida) ---
# Script com modo duplo de operação:
# - Se um argumento for fornecido (ex: nvim), sincroniza apenas esse módulo.
# - Se nenhum argumento for fornecido, sincroniza todos os diretórios na pasta dotfiles.

set -e # Pára o script se um comando falhar

# Define o diretório principal dos dotfiles
DOTFILES_DIR="$HOME/dotfiles"

# --- FUNÇÃO PRINCIPAL DE SINCRONIZAÇÃO ---
# Toda a lógica foi movida para esta função para que possa ser chamada para um ou vários módulos.
sync_module() {
  local MODULE_NAME="$1" # 'local' aqui está correto, pois está dentro de uma função.
  local SOURCE_DIR="$DOTFILES_DIR/$MODULE_NAME"
  local TARGET_DIR="$HOME/.config/$MODULE_NAME"

  # Verifica se o diretório de origem do módulo realmente existe
  if [ ! -d "$SOURCE_DIR" ]; then
    echo "⚠️  Aviso: Pulando '$MODULE_NAME' pois não é um diretório válido."
    return
  fi

  echo "⚙️  Sincronizando módulo: '$MODULE_NAME'"
  echo "----------------------------------------------------"

  # Percorre CADA item (arquivos E diretórios) na origem
  find "$SOURCE_DIR" | while read -r source_item; do
    target_item="${source_item/$SOURCE_DIR/$TARGET_DIR}"

    if [ -d "$source_item" ]; then
      # Se for um diretório, apenas garante que ele exista no destino.
      mkdir -p "$target_item"
    elif [ -f "$source_item" ]; then
      # Se for um arquivo, remove o que estiver no destino e cria o link.
      if [ -e "$target_item" ] || [ -L "$target_item" ]; then
        rm -f "$target_item"
      fi
      # Garante que o diretório pai exista antes de criar o link
      mkdir -p "$(dirname "$target_item")"
      ln -s "$source_item" "$target_item"
    fi
  done
  echo "✅ Módulo '$MODULE_NAME' sincronizado."
}

# --- LÓGICA DE EXECUÇÃO ---
# Verifica se o primeiro argumento ($1) foi fornecido.
if [ -n "$1" ]; then
  # MODO 1: Argumento fornecido, sincroniza apenas um módulo.
  echo "Iniciando sincronização para o módulo específico: $1"
  sync_module "$1"
else
  # MODO 2: Nenhum argumento, sincroniza todos os módulos.
  echo "Iniciando sincronização para TODOS os módulos em $DOTFILES_DIR..."

  for module_path in "$DOTFILES_DIR"/*/; do
    # Pega apenas o nome do diretório do caminho completo
    # --- A CORREÇÃO ESTÁ AQUI ---
    # Removido o 'local' que estava causando o erro.
    module_name=$(basename "$module_path")

    # Pula o diretório .git e qualquer outro arquivo que comece com ponto
    if [[ "$module_name" == .* ]]; then
      continue
    fi

    # Adiciona uma linha para separar a saída de cada módulo
    echo
    sync_module "$module_name"
  done
fi

echo
echo "🎉 Processo de sincronização concluído."
