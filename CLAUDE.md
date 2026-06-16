# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## このリポジトリについて

日々のプログラミング学習における「コードの検証」や「技術的な実験」を蓄積するサンドボックス。  
理論的な解説は個人用Obsidianに集約しており、ここでは「動く成果物」と「実装上の気づき」に特化して管理している。

## ディレクトリ構成ルール

- 単発の検証・練習：`2026/MM-DD-トピック名/` に `main.rb`（またはトピックに合ったファイル名）と `README.md` を置く
- 週次課題シリーズ：`2026/studyRuby_MMDD_MMDD/` に `dayN_テーマ.rb` を1日1ファイルで並べる（READMEなし、気づきはコード内コメントで管理）
- RSpecテストがある場合は `spec/` サブディレクトリに `*_spec.rb` を置く

## コマンド

```bash
# テスト（全件）
rspec --pattern '**/spec/**/*_spec.rb'

# テスト（単一ファイル）
rspec 2026/05-10-first-programming/spec/calculator_spec.rb

# Lint
rubocop
```

CIはGitHub Actions（`.github/workflows/spec_lint.yml`）でmainブランチへのpush・PRで自動実行される。  
Ruby バージョン：3.3.10

## 技術スタック

- Ruby（メイン）：ロジック検証・クラス設計・配列/ハッシュ操作
- RSpec：テストフレームワーク（`# frozen_string_literal: true` を先頭に記載）
- RuboCop：Linter（`spec/` ディレクトリは `Metrics/BlockLength` チェックから除外）
- React / Vite：`05-13-react-user-json/web-app/` のみ（例外的な存在）

## コミットルール

```
feat:     新しい実験コードの追加
fix:      コードの修正やエラーの解決
docs:     READMEなどのドキュメント整備
refactor: コードの整理
test:     テストケースの作成
```