#!/bin/bash

# ============================================
# check-env.sh — Claude Code 学習環境チェッカー
# ============================================
# 使い方: bash scripts/check-env.sh
# ============================================

# カラー設定
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PASS=0
FAIL=0

echo ""
echo "========================================"
echo " Claude Code マスター講座 — 環境チェック"
echo "========================================"
echo ""

# --- Node.js チェック ---
echo "📦 Node.js のバージョン確認..."
if command -v node &> /dev/null; then
  NODE_VERSION=$(node -v | sed 's/v//')
  MAJOR=$(echo $NODE_VERSION | cut -d. -f1)
  if [ "$MAJOR" -ge 18 ]; then
    echo -e "  ${GREEN}✅ Node.js v${NODE_VERSION} — OK（18以上が必要）${NC}"
    PASS=$((PASS+1))
  else
    echo -e "  ${RED}❌ Node.js v${NODE_VERSION} — バージョンが古いです（18以上が必要）${NC}"
    echo -e "  ${YELLOW}   → nodejs.org から最新のLTS版をインストールしてください${NC}"
    FAIL=$((FAIL+1))
  fi
else
  echo -e "  ${RED}❌ Node.js が見つかりません${NC}"
  echo -e "  ${YELLOW}   → nodejs.org からインストールしてください${NC}"
  FAIL=$((FAIL+1))
fi

# --- npm チェック ---
echo ""
echo "📦 npm の確認..."
if command -v npm &> /dev/null; then
  NPM_VERSION=$(npm -v)
  echo -e "  ${GREEN}✅ npm v${NPM_VERSION} — OK${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${RED}❌ npm が見つかりません（Node.js と一緒にインストールされるはずです）${NC}"
  FAIL=$((FAIL+1))
fi

# --- Git チェック ---
echo ""
echo "🔧 Git の確認..."
if command -v git &> /dev/null; then
  GIT_VERSION=$(git --version | awk '{print $3}')
  echo -e "  ${GREEN}✅ Git v${GIT_VERSION} — OK${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${RED}❌ Git が見つかりません${NC}"
  echo -e "  ${YELLOW}   → git-scm.com からインストールしてください${NC}"
  FAIL=$((FAIL+1))
fi

# --- Claude Code チェック ---
echo ""
echo "🤖 Claude Code の確認..."
if command -v claude &> /dev/null; then
  CLAUDE_VERSION=$(claude --version 2>/dev/null || echo "バージョン取得できず")
  echo -e "  ${GREEN}✅ Claude Code ${CLAUDE_VERSION} — インストール済み${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${YELLOW}⚠️  Claude Code がまだインストールされていません${NC}"
  echo -e "  ${YELLOW}   → 以下のコマンドでインストールしてください:${NC}"
  echo -e "  ${YELLOW}   npm install -g @anthropic-ai/claude-code${NC}"
  # インストール未完了は FAIL にしない（この段階では正常）
fi

# --- .claudeignore チェック ---
echo ""
echo "🛡️  .claudeignore の確認..."
if [ -f ".claudeignore" ]; then
  echo -e "  ${GREEN}✅ .claudeignore が存在します${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${YELLOW}⚠️  .claudeignore が見つかりません${NC}"
  echo -e "  ${YELLOW}   → このファイルが必要な理由は第2章で学びます${NC}"
fi

# --- Git 初期化チェック ---
echo ""
echo "🔒 Git リポジトリの確認..."
if [ -d ".git" ]; then
  echo -e "  ${GREEN}✅ Git リポジトリが初期化されています${NC}"
  PASS=$((PASS+1))
else
  echo -e "  ${YELLOW}⚠️  Git が初期化されていません${NC}"
  echo -e "  ${YELLOW}   → 以下を実行して安全ネットを張ってください:${NC}"
  echo -e "  ${YELLOW}   git init && git add . && git commit -m '初期コミット'${NC}"
fi

# --- 結果表示 ---
echo ""
echo "========================================"
echo " チェック結果"
echo "========================================"
echo -e " ${GREEN}✅ 合格: ${PASS} 項目${NC}"
if [ $FAIL -gt 0 ]; then
  echo -e " ${RED}❌ 要対応: ${FAIL} 項目${NC}"
  echo ""
  echo -e " ${YELLOW}上記の ❌ の項目を対処してから講座を進めてください。${NC}"
  echo -e " ${YELLOW}分からなければ Claude に聞いてみましょう！${NC}"
else
  echo ""
  echo -e " ${GREEN}🎉 環境チェック完了！講座を始める準備ができています。${NC}"
  echo ""
  echo " 次のステップ："
  echo "   claude  ← このコマンドで Claude Code を起動"
fi
echo "========================================"
echo ""
