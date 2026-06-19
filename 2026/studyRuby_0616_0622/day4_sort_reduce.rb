# =============================================================
# Day 4（木）— sort / min / max / reduce（並び替え・集計）
# テーマ：アイテムショップの在庫を集計・整列する
# =============================================================
# 【課題】
#   shop 配列を使って以下を実装する
#
#   1. sort_by を使って価格(price)が安い順に並び替えて puts する
#
#   2. sort_by を使って名前(name)のアルファベット順に並び替えて puts する
#
#   3. min_by を使って最安値のアイテムを取得して puts する
#
#   4. max_by を使って最高値のアイテムを取得して puts する
#
#   5. map と reduce（または sum）を使って全アイテムの合計金額を puts する
#      ヒント: まず map で price だけの配列にしてから sum する
#
#   6. select と sum を組み合わせて
#      price が100以下のアイテムの合計金額を puts する
#
# 【確認ポイント】
#   - sort と sort_by の違いを説明できるか
#   - reduce と sum の関係を言えるか
#   - メソッドチェーン（.map{}.sum など）の読み方を説明できるか
# =============================================================

shop = [
  { name: "ポーション",   price: 50  },
  { name: "エリクサー",   price: 300 },
  { name: "剣",           price: 200 },
  { name: "盾",           price: 150 },
  { name: "解毒薬",       price: 80  },
  { name: "蘇生の羽根",   price: 500 },
]

# 1. 価格が安い順
# sortとsort_byは記述が簡易的になるか、基本的にはsort_byの方が動作は軽い
#今回は価格が安い場合なのでpriceを昇順にする。基本的にsort_byは昇順動作
puts "--- 1 ---"
puts shop.sort_by { |s| s[:price] }

# 2. 名前のアルファベット順（name で sort_by）
# 日本語だけど動作的には文字に含まれるコード順かな多分
puts "--- 2 ---"
puts shop.sort_by { |s| s[:name] }

# 3. 最安値のアイテム
# 使い方は分からないけど多分1版小さい数字を1個だけ返してくれるはず
puts "--- 3 ---"
puts shop.min_by { |s| s[:price] }

# 4. 最高値のアイテム
puts "--- 4 ---"
puts shop.max_by { |s| s[:price] }

# 5. 全アイテムの合計金額
# まずはmapでpriceだけの配列にするらしい
puts "--- 5 ---"
shop_price = shop.map { |s| s[:price]}
# p shop_price デバッグとして。ちゃんと配列になっている
puts shop_price.sum

# 6. price 100以下の合計金額
# selectは確かtrueになるものを抽出する。よって100以下のものを抽出したあとにsumをすればいいと思う
# ちなみにこのままだとオブジェクトのため、これをmapで区切る。で、これを足す。ものすごく分かりづらいけどこういうこともできると思うので挑戦。
puts "--- 6 ---"
puts shop_price_under_100 = shop.select { |s| s[:price] <= 100 }.map { |s| s[:price]}.sum

# shop_price_under_100 = shop.select { |s| s[:price] <= 100 }
# price_map = shop_price_under_100.map { |s| s[:price]}
# puts price_map.sum

puts "--- test ---"
puts shop.select { |s| s[:price] <= 100 }.sum { |s| s[:price] }
