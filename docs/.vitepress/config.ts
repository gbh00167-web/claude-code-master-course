import { defineConfig } from 'vitepress'

export default defineConfig({
  lang: 'ja',
  title: 'Claude Code マスター講座',
  description: '個人事業主のための業務自動化 実践ガイド',

  themeConfig: {
    nav: [
      { text: 'ホーム', link: '/' },
      { text: '章一覧', link: '/chapters/00-preface' },
      { text: 'コマンドリファレンス', link: '/references/commands' },
    ],

    sidebar: [
      {
        text: '📖 はじめに',
        items: [
          { text: '前書き', link: '/chapters/00-preface' },
        ],
      },
      {
        text: '第1部　基礎編',
        items: [
          { text: '第1章　Claude Code とは', link: '/chapters/01-what-is-claude-code' },
          { text: '第2章　はじめての起動と安全の基本', link: '/chapters/02-first-launch' },
          { text: '第3章　エージェントの動かし方', link: '/chapters/03-agent-control' },
        ],
      },
      {
        text: '第2部　実践編',
        items: [
          { text: '第4章　ファイルを読ませる', link: '/chapters/04-reading-files' },
          { text: '第5章　ファイルを書かせる・整形させる', link: '/chapters/05-writing-files' },
        ],
      },
      {
        text: '第3部　応用編',
        items: [
          { text: '第6章　CLAUDE.md で仕事スタイルを覚えさせる', link: '/chapters/06-claude-md-settings' },
          { text: '第7章　MCP で外部ツールと繋ぐ', link: '/chapters/07-mcp-tools' },
        ],
      },
      {
        text: '第4部　完結編',
        items: [
          { text: '第8章　卒業演習', link: '/chapters/08-graduation' },
        ],
      },
      {
        text: '📚 付録',
        items: [
          { text: 'コマンドリファレンス', link: '/references/commands' },
          { text: 'プロンプト早見表', link: '/references/prompts-cheatsheet' },
          { text: 'コスト・料金ガイド', link: '/references/cost-guide' },
        ],
      },
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/anthropics/claude-code' },
    ],

    footer: {
      message: 'Claude Code マスター講座',
      copyright: '© 2025 — 個人事業主向け業務自動化ガイド',
    },

    search: {
      provider: 'local',
    },

    editLink: {
      pattern: 'https://github.com/your-repo/claude-code-master-course/edit/main/docs/:path',
      text: 'このページを編集',
    },

    outlineTitle: 'このページの内容',
    returnToTopLabel: '先頭へ戻る',
    sidebarMenuLabel: 'メニュー',
    darkModeSwitchLabel: 'ダークモード',
    lightModeSwitchTitle: 'ライトモードに切り替え',
    darkModeSwitchTitle: 'ダークモードに切り替え',
  },
})
