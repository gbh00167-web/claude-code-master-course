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
| 構成 | 前書き + 第1〜8章（理解度クイズ付き）|
| 公開URL | https://gbh00167-web.github.io/claude-code-master-course/ |

---

## 現在のシステム構成

### サイト本体
- **`index.html`**（リポジトリルート）が唯一のサイトファイル
- VitePress は使用していない（過去の構成）
- GitHub Actions（`.github/workflows/deploy.yml`）でリポジトリルートを GitHub Pages にデプロイ

### 認証・データ管理（Firebase）
- **Firebase プロジェクト**：`claude-code-master-program`
- **認証方式**：メールアドレス＋パスワード（Firebase Authentication）
- **データ保存**：Firestore（コレクション：`users/{uid}`）
- **管理者アカウント**：`gbh00167@gmail.com`（このメールのみ管理者画面にアクセス可）

### Firestore のデータ構造
```
users/{uid}/
  displayName: string       ← ユーザーの名前
  email: string             ← メールアドレス
  completedChapters: number[] ← 完了した章のID配列（0〜8）
  quizResults: object       ← クイズ回答結果 { "chId_qi": true/false }
  joinedAt: Timestamp       ← 登録日時
  lastUpdated: Timestamp    ← 最終更新日時
```

### Firestore セキュリティルール（設定済み）
```
match /users/{userId} {
  allow read, write: if request.auth != null && request.auth.uid == userId;
  allow read: if request.auth != null
              && request.auth.token.email == 'gbh00167@gmail.com';
}
```

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

## プロジェクト構成（現在）

```
claude-code-master-course/
├── CLAUDE.md                        ← 今ここ
├── README.md                        ← 受講者向け案内
├── index.html                       ← サイト本体（全コンテンツ・Firebase連携）
├── .gitignore
├── .github/
│   └── workflows/
│       └── deploy.yml               ← GitHub Pages 自動デプロイ
├── docs/
│   ├── chapters/                    ← 章テキスト（Markdown 原稿）
│   │   ├── 00-preface.md 〜 08-graduation.md
│   ├── exercises/                   ← 章末演習プロンプト集
│   └── references/                  ← 早見表・リファレンス
├── scripts/
│   ├── check-env.sh
│   └── setup-git.sh
└── templates/                       ← 受講者が使うテンプレート
```

### サイトの編集方法
```bash
# index.html を編集後、git push するだけで自動デプロイされる
git add index.html
git commit -m "変更内容のメモ"
git push origin main
# → GitHub Actions が自動で GitHub Pages を更新する
```

---

## セキュリティ注意事項

- Firebase の `apiKey` は公開リポジトリに入っているが、これは Firebase の仕様上問題ない
  （セキュリティは Firestore ルールで担保する）
- Firebase の管理コンソールへのアクセス情報はリポジトリに入れないこと
- 受講者の個人情報（メール・氏名）は Firestore に保存されている。取り扱いに注意すること
- `.env` ファイルは `.gitignore` に登録済み
