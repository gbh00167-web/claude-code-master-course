#!/bin/bash

# ============================================
# check-env.sh — Claude Code 環境チェッカー
# ============================================
# 使い方: bash scripts/check-env.sh
# ============================================

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

PASS=0
FAIL=0

echo ""
echo "========================================"
echo " Claude Code マスター講座 — 環境チェック"
echo "========================================"
echo ""

# --- Node.js チェック ---
echo "Node.js のバージョン確認..."
if command -v node &> /dev/null; then
  NODE_VERSION=$(node -v | sed 's/v//')
  MAJOR=$(echo $NODE_VERSION | cut -d. -f1)
  if [ "$MAJOR" -ge 18 ]; then
    echo -e "  ${GREEN}OK  Node.js v${NODE_VERSION}${NC}"
    PASS=$((PASS+1))
  else
    echo -e "  ${RED}NG  Node.js v${NODE_VERSION}（バージョン18以上が必要）${NC}"
    echo -e "  ${YELLOW}    → nodejs.org から最新のLTS版をインストールしてください${NC}"
    FAIL=$((FAIL+1))
  fi
else
  echo -e "  ${RED}NG  Node.js が見つかりません${NC}"
  echo -e "  ${YELLOW}    → nodejs.org からインストールしてください${NC}"
  FAIL=$((FAIL+1))
fi

# --- Claude Code チェック ---
echo ""
echo "Claude Code の確認..."
if command -v claude &> /dev/null; then
  echo -e "  ${GREEN}OK  Claude Code インストール済み${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${YELLOW}未  Claude Code がまだインストールされていません${NC}"
  echo -e "  ${YELLOW}    → 以下のコマンドでインストールしてください:${NC}"
  echo -e "  ${YELLOW}    npm install -g @anthropic-ai/claude-code${NC}"
fi

# --- Git チェック ---
echo ""
echo "Git の確認..."
if command -v git &> /dev/null; then
  GIT_VERSION=$(git --version | awk '{print $3}')
  echo -e "  ${GREEN}OK  Git v${GIT_VERSION}${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${YELLOW}未  Git が見つかりません（あると安心です）${NC}"
  echo -e "  ${YELLOW}    → git-scm.com からインストールしてください${NC}"
fi

# --- .claudeignore チェック ---
echo ""
echo ".claudeignore の確認..."
if [ -f ".claudeignore" ]; then
  echo -e "  ${GREEN}OK  .claudeignore が存在します${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${YELLOW}未  .claudeignore が見つかりません${NC}"
  echo -e "  ${YELLOW}    → Claude Code 起動後に設定してもらいましょう${NC}"
fi

# --- 結果 ---
echo ""
echo "========================================"
echo " チェック結果"
echo "========================================"
if [ $FAIL -gt 0 ]; then
  echo -e " ${RED}要対応の項目があります。上記の「NG」を確認してください。${NC}"
  echo -e " ${YELLOW}わからなければ claude.ai にアクセスして質問してみてください。${NC}"
else
  echo -e " ${GREEN}環境チェック完了！Claude Code を始める準備ができています。${NC}"
  echo ""
  echo " 次のステップ："
  echo "   claude  ← このコマンドで Claude Code を起動"
fi
echo "========================================"
echo ""
