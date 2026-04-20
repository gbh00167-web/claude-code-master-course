#!/bin/bash
# setup-git.sh — Git 安全ネット 初期化ヘルパー
# 使い方: bash scripts/setup-git.sh

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "🔒 Git 安全ネット セットアップ"
echo "================================"

if [ -d ".git" ]; then
  echo -e "${YELLOW}⚠️  Git はすでに初期化されています${NC}"
else
  git init
  echo -e "${GREEN}✅ git init 完了${NC}"
fi

git add .
git commit -m "初期セーブ: Claude Code 講座プロジェクト"
echo -e "${GREEN}✅ 初期コミット完了${NC}"

echo ""
echo "🛡️  これで安全ネットが張れました！"
echo "AIが暴走したら以下で元に戻せます:"
echo "  git restore ."
echo ""
