# === 環境変数・PATH関連 ===
# brewパス設定
eval "$(/opt/homebrew/bin/brew shellenv)"
# claudeパス設定
export PATH="$HOME/.local/bin:$PATH"
# raspberry pi pico 環境変数設定
export PICO_SDK_PATH=$HOME/Documents/dev/embedded/vendor/pico-sdk

# === エイリアス ===
# ESP32(Rust)開発用の環境変数を読み込むエイリアス
alias get_esprs='. $HOME/export-esp.sh'

# === 補完設定 ===
# 補完システムの初期化
autoload -Uz compinit
compinit
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# sshで~/.ssh/configのHost名一覧を表示
function _ssh {
  compadd $(grep -F 'Host ' ~/.ssh/config | awk '{print $2}' | grep -v '\*' | sort)
}
# eim（ESP-IDF Installation Manager）の補完
eval "$(eim completions zsh)"
# uv uvx Shell autocompletion
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
# veryl verylup の補完
eval "$(verylup completion zsh veryl)"
eval "$(verylup completion zsh verylup)"

# === プロンプト設定 ===
# プロンプトの表示形式を作業ディレクトリにする
PROMPT='%~ %# '

# === その他アプリケーション設定
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Set up fnm
eval "$(fnm env --use-on-cd --shell zsh)"
