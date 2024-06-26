# プロンプト
# 現在日時 ... %D{%Y/%m/%d %H:%M:%S}
export PS1="[%n@%m %~]%# "

# lsコマンドエイリアス
alias ls="ls -aF --color=auto"
alias ll="ls -laF --color=auto"

# treeコマンドで日本語が表示できるようにする
# -N ... Print non-printable characters as is.
# 『印刷不可能な文字をそのまま印刷する』
alias tree='tree -N'

# historyコマンドで日時表示・全件表示する
alias history='history -i -t "%Y-%m-%dT%H:%M:%S" 0'

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=1000000

# ディレクトリ移動にcdを省略できるようにする
setopt auto_cd

# cd履歴をみれるように変更
setopt auto_pushd

# インタラクティブシェルにおいて#以降をコメントとして扱う
setopt interactive_comments

# history に時刻を記録する
setopt extended_history

# 他のzshインスタンスと履歴を共有する
setopt SHARE_HISTORY

# zsh-syntax-highlighting を導入する
if [ ! -e ~/.zsh/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-completion を導入する
if [ ! -e ~/.zsh/zsh-completions ]; then
    git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions
fi
fpath=(~/.zsh/completions $fpath)
autoload -U compinit
compinit -u

# zsh-autosuggestions を導入する
if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ff1493'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# 個別にパスなどを指定するときなどのためにローカル用の設定を読み込めるようにする
if [[ -e ~/.zshrc_local ]]; then
    source ~/.zshrc_local
fi

# nvmスクリプトが存在する場合にそれを読み込む
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion