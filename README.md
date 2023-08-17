# よく使う設定ファイルをまとめたもの
## .profile_common
shとbashで使用する共通設定

## .zshrc_common
zshで使用する共通設定

## shellの設定ファイル
- gitコマンドの補完設定
- ターミナルの表示にブランチ名を表示

## 設定方法
### sh
1. .profile_commonをホームディレクトリにコピー
2. .profileに以下を追記
```.profile
if [ -f ~/.profile_common ]; then
    source ~/.profile_common
fi
```
3. 補完スクリプトの取得
```
# .git-completion.bashはv2.35.8以降になると未対応のコマンドがあるのでv2.35.8を指定
curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/v2.35.8/contrib/completion/git-completion.bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```

### bash
1. .profile_commonをホームディレクトリにコピー
2. .bashrcに以下を追記
```.bashrc
if [ -f ~/.profile_common ]; then
    source ~/.profile_common
fi
```
3. 補完スクリプトの取得
```
curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```

### zsh
1. .zshrc_commonをホームディレクトリにコピー
2. .zshrcに以下を追記
```.zshrc
if [ -f ~/.zshrc_common ]; then
    source ~/.zshrc_common
fi
```
3. .zshディレクトリをホームディレクトリに作成
4. 補完スクリプトの取得
```
curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o ~/.zsh/__git https://raw.githubusercontent.com/git/git/v2.35.8/contrib/completion/git-completion.zsh
```

### vim
1. .vimと.vimrcをホームディレクトリにコピー
2. NeoBundleのインストール
```
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
3. vimを起動してNeoBundleのインストール
```
# 自動インストール用の表示が出るので、そのままEnter

# 自動インストール用の表示が出なかった場合は以下を実行
:NeoBundleInstall
```





