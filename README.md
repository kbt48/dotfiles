# dotfiles

miseを使って開発環境とツールを管理するための設定集。

## 構成
- **ツール管理**: `mise.toml` で使用ツールとバージョンを一括定義。
- **設定ファイル**: `.vimrc`, `.bashrc`, `.tmux.conf` などのリンクを自動作成。

## セットアップ手順

### 1. miseのインストール
まだインストールしていない場合は、[miseの公式サイト](https://mise.jdx.dev/)に従って導入すること。

また、シェル（bash等）でmiseを有効化するために、以下の設定を `.bashrc` 等に追加する必要がある。

```bash
echo 'export PATH="$HOME/.local/share/mise/shims:$PATH"' >> ~/.bashrc
```

### 2. ツールのインストール
リポジトリ内の `mise.toml` に基づいて、必要なツールをインストールする。

```bash
mise install
```

### 3. 設定ファイルの展開
ホームディレクトリに各設定ファイルのシンボリックリンクを作成する。

```bash
mise run setup
```

## 管理ツール一覧
現在の `mise.toml` で管理しているツール：

### 開発言語・パッケージマネージャ
- python (3.12)
- uv

### クラウド・インフラ
- awscli
- azure-cli
- terraform
- sops
- age

### Kubernetes 関連
- kubectl
- helm
- kustomize
- flux2
- k9s
- talosctl
- talhelper
- stern

### kubectl プラグイン
- neat (itaysk/kubectl-neat)
- get-all (corneliusweig/ketall)
- status (bergerx/kubectl-status)
- tree (ahmetb/kubectl-tree)
- kubectx / kubens

## リンク対象ファイル
`setup` タスクで以下のシンボリックリンクが作成される：
- `.vimrc`
- `.bashrc`
- `.tmux.conf`
- `.gitconfig`
- .gitignore

## 運用・メンテナンス

### ツールのアップグレード
"latest" 指定のツールを一括で最新版にする：
```bash
mise upgrade
```

### ツールの再インストール
何らかの理由でツールを強制的にインストールし直す：
```bash
mise install -f
```

### 古いバージョンの削除
使われていない過去のバージョンを削除してディスクを整理する：
```bash
mise prune
```

