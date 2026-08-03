# === 環境変数・PATH関連 ===
# brewパス設定
eval "$(/opt/homebrew/bin/brew shellenv)"
# claudeパス設定
export PATH="$HOME/.local/bin:$PATH"

# === zshのオプション設定 ===

# === プロンプト設定 ===
# プロンプトの表示形式を作業ディレクトリにする
PROMPT='%~ %# '

# === その他アプリケーション設定
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Set up fnm
eval "$(fnm env --use-on-cd --shell zsh)"
