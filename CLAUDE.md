# Claude Code マスター講座 — プロジェクトルールブック

## 🎯 このファイルについて

これは `CLAUDE.md`（Claude Code の設定ファイル）です。
Claude Code がこのプロジェクトを開いた瞬間に自動で読み込まれ、
以下のルールがセッション全体に適用されます。

---

## 📚 講座の概要

本プロジェクトは **「Claude Code マスター講座」** の学習環境です。

| 項目 | 内容 |
|------|------|
| 対象 | ある程度コードは読めるが実務未経験の方 |
| 目標 | Claude Code を使った AI 駆動開発（AIDD）を習得する |
| 構成 | 前書き + 第1〜8章（演習付き）|

---

## 🤖 Claude Code へのルール（必ず遵守すること）

### 基本方針
- 受講者は **実務未経験** であることを常に念頭に置くこと
- コードの説明は **初心者にも理解できる日本語** で行うこと
- 専門用語は初出時に必ず括弧内で説明を付けること（例：Git（バージョン管理ツール））
- 「なぜそうするのか」という **理由** を省略しないこと

### コーディング規約
- 言語：このプロジェクト内のサンプルコードは原則 **TypeScript** を使用
- コメント：コードには **日本語コメント** を付けること
- 命名規則：変数・関数名は意味が明確な英語、ファイル名は `kebab-case`
- インデント：スペース2つ（タブ禁止）

### 禁止事項
- `any` 型の使用は禁止（必ず具体的な型を定義すること）
- インラインスタイル（`style={{...}}`）は禁止
- `console.log` をそのままコミットしない（デバッグ後は必ず削除）
- 確認なしに `.env` ファイルを読み込まない

### 演習サポートのルール
- `/ask` コマンドを使った質問には、コードを書かずに説明のみを行う
- 受講者が「自分で試したい」と言った場合は、答えを先に言わず **ヒント** を出す
- エラーが出た場合は、いきなり修正せず **まず原因を解説してから** 修正する

---

## 📁 プロジェクト構成

```
claude-code-master-course/
├── CLAUDE.md              ← 今ここ（Claude Code のルールブック）
├── README.md              ← 受講者向け案内
├── .claudeignore          ← Claude Code に読ませないファイルの設定
├── docs/
│   ├── chapters/          ← 各章のテキスト（Markdown）
│   │   ├── 00-preface.md
│   │   ├── 01-cli-agent.md
│   │   ├── 02-agent-loop.md
│   │   ├── 03-code-exploration.md
│   │   ├── 04-aidd-implementation.md
│   │   ├── 05-debug-and-test.md
│   │   ├── 06-mcp-extension.md
│   │   ├── 07-best-practices.md
│   │   └── 08-graduation-project.md
│   ├── exercises/         ← 章末演習プロンプト集
│   │   ├── ex-01.md
│   │   ├── ex-02.md
│   │   ├── ex-03.md
│   │   ├── ex-04.md
│   │   ├── ex-05.md
│   │   ├── ex-06.md
│   │   └── ex-07.md
│   └── references/        ← 早見表・コマンドリファレンス
│       ├── commands.md
│       ├── prompts-cheatsheet.md
│       └── cost-guide.md
├── scripts/               ← セットアップ・確認用スクリプト
│   ├── check-env.sh       ← 環境確認スクリプト
│   └── setup-git.sh       ← Git 初期化ヘルパー
└── templates/             ← 各種テンプレート
    ├── CLAUDE.md.template ← 受講者が自分のプロジェクトに使う CLAUDE.md 雛形
    ├── .claudeignore.template
    └── commit-message.md
```

---

## 🚀 受講者へのクイックスタート

```bash
# 1. この講座プロジェクトを Claude Code で開く
cd claude-code-master-course
claude

# 2. まず Claude に自己紹介させてみる
> このプロジェクトの概要と学習の流れを教えて

# 3. 第1章から順に進める
> docs/chapters/01-cli-agent.md を読んで、この章の要点を教えて
```

---

## ⚠️ セキュリティ注意事項

- API キーや認証情報は絶対にこのリポジトリに入れないこと
- `.env` ファイルは `.claudeignore` と `.gitignore` の両方に登録済み
- 演習中に生成したコードを公開リポジトリにプッシュする際は、秘密情報が含まれていないか必ず `git diff` で確認すること
