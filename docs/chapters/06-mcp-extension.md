# 第6章：MCPによる機能拡張 — AIに新しい「目」と「手」を与える

> **学習目的：** MCP（Model Context Protocol）の概念を理解し、外部リソースとClaude Codeを接続する
> **学習成果：** Claudeの能力をローカル環境を超えて拡張し、高度な自律的ワークフローを構築できる
> **目安時間：** 90分
> **演習：** [`docs/exercises/ex-06.md`](../exercises/ex-06.md)

---

## はじめに：Claude Codeの「3つの壁」

ここまで学んだClaude Codeは強力ですが、実務で使い続けると以下の壁にぶつかります。

1. **壁1：最新ライブラリに対応できない** — AIの知識は学習カットオフ日で止まっている
2. **壁2：データベースの「中身（生データ）」が見えない** — コードは読めてもDBのレコードは見えない
3. **壁3：外部ツールとの分断** — GitHubのIssue確認にブラウザを開く必要がある

これらを破壊するのが**「MCP（Model Context Protocol）」**です。

---

## 6.1 概念：MCPとは何か（AIのための「USBポート」）

MCP（Model Context Protocol）とは、**「AIに新しい能力を追加するための、世界共通のプラグイン規格」**です。

パソコンにUSBでマウスやカメラを挿すように、Claude Codeに以下のMCPサーバーを「挿す」ことで機能が拡張されます。

| MCPサーバー | 追加される能力 |
|-----------|-------------|
| Brave Search | インターネット検索（最新情報へのアクセス） |
| SQLite / PostgreSQL | データベースへの直接接続・操作 |
| GitHub | Issue読み書き、PR作成の自動化 |
| 社内Wiki（自作） | 社内固有の知識へのアクセス |

> **従来のAPIとの違い：** 通常のAPIは「人間（エンジニア）」が呼び出すものでした。MCPは「AI自身」が使い方を理解し、自分の意志で呼び出すために設計されています。

---

## 6.2 実践：MCPサーバーの導入

### MCPの管理コマンド

```bash
# 現在接続されているMCPを確認
claude mcp list

# MCPを追加
claude mcp add <名前> <コマンド>

# MCPを削除
claude mcp remove <名前>
```

### 実例1：Web検索（Brave Search）

```bash
# Brave Search APIキーを事前に取得してから実行
claude mcp add brave-search npx -y @modelcontextprotocol/server-brave-search
```

**活用プロンプト例：**
```
> 最近リリースされた tailwindcss v4 の公式ドキュメントを
  Brave Searchで検索して読み込み、現在のプロジェクトの設定ファイルを
  v4の新しい書き方にリファクタリングしてください。
```

### 実例2：データベースの直接操作

```bash
# SQLiteの場合
claude mcp add sqlite npx -y @modelcontextprotocol/server-sqlite --db-path ./my-database.db
```

**活用プロンプト例：**
```
> `users` テーブルの中身を確認してください。
  `status` が 'active' なのに `last_login_at` が5年以上更新されていない
  休眠ユーザーの一覧と人数を教えてください。（変更は行わないでください）
```

> 🚨 データの変更（INSERT, UPDATE, DELETE）を伴うクエリは必ずAIが事前に確認を求めます。`y` を押すまで実行されません。

### 実例3：GitHub連携

```bash
claude mcp add github npx -y @modelcontextprotocol/server-github
```

**究極の全自動ワークフロー：**
```
> 1. GitHubのIssue #42（ログインボタンのスマートフォン表示ずれ）を読み込んで把握してください。
  2. プロジェクト内の該当ファイルを特定し、Tailwind CSSを修正してバグを直してください。
  3. 修正が終わったらコミットし、Issue #42をクローズするPull Requestを作成してください。
```

---

## 6.3 展望：自作MCPサーバーで独自ワークフローを構築する

世界中の誰も知らない「社内専用のナレッジ」や「自社開発の非公開API」にClaudeがアクセスできるMCPサーバーを自作することができます。

```
> このAPIエラーコード「ERR_999」の意味を社内Wikiで調べて
```

→ 社内Wiki MCPが接続されていれば、まるでベテラン社員のように社内事情に精通した回答が得られます。

---

## まとめ

- MCPはClaudeにWeb検索・DB接続・GitHub操作などの「新しい手足」を与える規格
- `claude mcp add` コマンドで数秒で機能が追加できる
- DB変更・Git操作などは必ず確認を求めてくるので安全

---

## ▶️ 次のステップ

演習を終えたら → [第7章：実務最適化とベストプラクティス](./07-best-practices.md)
