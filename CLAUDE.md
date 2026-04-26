# Claude Code マスター講座 — プロジェクトルールブック

## このファイルについて

これは `CLAUDE.md`（Claude Code の設定ファイル）です。
Claude Code がこのプロジェクトを開いた瞬間に自動で読み込まれ、
以下のルールがセッション全体に適用されます。

---

## 講座の概要

本プロジェクトは **「Claude Code マスター講座」（個人事業主版）** の学習環境です。

| 項目 | 内容 |
|------|------|
| 対象 | Mac を使っている個人事業主の方 |
| 前提知識 | ターミナルで `cd` コマンドが使える程度 |
| 目標 | 繰り返し業務を Claude Code で自動化できる |
| 構成 | 前書き + 第1〜8章（演習付き）|
| サイト | `npm run docs:dev` でブラウザで確認できます |

---

## Claude Code へのルール（必ず遵守すること）

### 基本方針

- 受講者は **非エンジニアの個人事業主** であることを常に念頭に置くこと
- 説明は **初心者にも分かる日本語** で行うこと
- 専門用語は初出時に必ず括弧内で説明を付けること（例：Git（バージョン管理ツール））
- 「なぜそうするのか」という **理由** を省略しないこと
- コードや技術的な説明より、**業務への応用イメージ** を先に示すこと

### 禁止事項

- エンジニア向けの専門用語を説明なしに使わない
- コードのデバッグや開発作業は講座の対象外（受講者はエンジニアではない）
- 確認なしに `.env` ファイルや `private/` フォルダを読み込まない
- 業務上の機密情報が含まれうるファイルは慎重に扱う

### 演習サポートのルール

- 受講者が「自分で試したい」と言った場合は、答えを先に言わず **ヒント** を出す
- エラーが出た場合は、いきなり修正せず **まず原因を解説してから** 修正する
- 「難しい」「わからない」と言われたら、より具体的な例え話で説明し直す

---

## プロジェクト構成

```
claude-code-master-course/
├── CLAUDE.md              ← 今ここ（Claude Code のルールブック）
├── README.md              ← 受講者向け案内
├── package.json           ← VitePress（静的サイト生成ツール）の設定
├── .gitignore
├── .claudeignore          ← Claude Code に読ませないファイルの設定
├── docs/
│   ├── .vitepress/        ← サイトの設定
│   │   └── config.ts
│   ├── index.md           ← トップページ
│   ├── chapters/          ← 各章のテキスト（Markdown）
│   │   ├── 00-preface.md
│   │   ├── 01-what-is-claude-code.md
│   │   ├── 02-first-launch.md
│   │   ├── 03-agent-control.md
│   │   ├── 04-reading-files.md
│   │   ├── 05-writing-files.md
│   │   ├── 06-claude-md-settings.md
│   │   ├── 07-mcp-tools.md
│   │   └── 08-graduation.md
│   ├── exercises/         ← 章末演習プロンプト集
│   │   ├── ex-01.md 〜 ex-07.md
│   └── references/        ← 早見表・リファレンス
│       ├── commands.md
│       ├── prompts-cheatsheet.md
│       └── cost-guide.md
├── scripts/
│   ├── check-env.sh       ← 環境確認スクリプト
│   └── setup-git.sh       ← Git 初期化ヘルパー
└── templates/             ← 受講者が使うテンプレート
```

---

## 受講者へのクイックスタート

```bash
# 1. この講座プロジェクトを Claude Code で開く
cd claude-code-master-course
claude

# 2. まず Claude に自己紹介させてみる
> このプロジェクトについて教えてください。どんな講座ですか？

# 3. 前書きから順に進める
> docs/chapters/00-preface.md を読んで、この講座の概要を教えて
```

### サイトとして表示する

```bash
# 開発サーバーを起動（ブラウザで確認できます）
npm run docs:dev

# 静的サイトをビルドする
npm run docs:build
```

---

## セキュリティ注意事項

- API キーや認証情報は絶対にこのリポジトリに入れないこと
- `.env` ファイルは `.claudeignore` と `.gitignore` の両方に登録済み
- 受講者の業務ファイルをこのリポジトリに入れないよう注意すること
