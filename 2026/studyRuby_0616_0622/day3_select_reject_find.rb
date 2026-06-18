# =============================================================
# Day 3（水）— select / reject / find（絞り込み・検索）
# テーマ：クエスト一覧から条件で絞り込む
# =============================================================
# 【課題】
#   quests 配列を使って以下を実装する
#
#   1. select を使って難易度(difficulty)が3以上のクエストだけ
#      取り出して puts する
#
#   2. reject を使って完了済み(cleared: true)のクエストを除いた
#      一覧を puts する
#
#   3. find を使って名前が "ドラゴン討伐" のクエストを1件取得して
#      puts する
#
#   4. any? を使って難易度5のクエストが存在するか puts する
#
#   5. all? を使って全クエストが未クリアか puts する
#
#   6. count を使って未クリアのクエスト数を puts する
#
# 【確認ポイント】
#   - select と find の違いを説明できるか（返すものが違う）
#   - reject が select の逆であることを言えるか
#   - any? / all? / count にもブロックが使えることを確認したか
# =============================================================

quests = [
  { name: "スライム退治",   difficulty: 1, cleared: true  },
  { name: "ゴブリン討伐",   difficulty: 2, cleared: false },
  { name: "ドラゴン討伐",   difficulty: 5, cleared: false },
  { name: "宝箱の謎を解く", difficulty: 3, cleared: false },
  { name: "古代遺跡探索",   difficulty: 4, cleared: true  },
]

# 1. 難易度3以上のクエスト
# まずqで取り出すとハッシュ形式のものが出される。これをクオテーションでキーを囲むと良いはずなので…って思ったけど特に出ない
# selectはブロック内でtrueになるものだけ返すので……そもそもまずはハッシュの呼び出し方を考えよう
# slime_quest = { name: "スライム退治",   difficulty: 1, cleared: true  }
# puts slime_quest[:name]
# なるほどハッシュを呼び出す時は:を付けないと行けないのね

puts quests.select { |q| q[:difficulty] >= 3 } # 恐らくこれをそのままputsすればハッシュが取り出せる。あとはこれを整形する形がベターになる。たとえとしては
quests.select { |q| q[:difficulty] >= 3 }.each do |i|
  puts "クエスト名: #{i[:name]}, 難易度: #{i[:difficulty]}, クリア: #{i[:cleared]}"
end

# こんな感じか。合わせると分かりづらそうなので45行目は変数に入れたほうが分かりやすいかも

# 2. 未クリアのクエスト（クリア済みを除く）
# rejectはselectの反対なので実質同じ役割だけど明示的に書けるため分かりやすい時はこっち使うとか？
puts quests.reject { |q| q[:cleared] == true }

# 3. "ドラゴン討伐" を検索
# 要素に対して最初に真になるものを返すのがfind。つまり1個だけの探索で扱うタイプ
puts quests.find { |q| q[:name] == "ドラゴン討伐" }

# 4. 難易度5のクエストが存在するか
# 全ての要素が偽であればfalseを返すが1個でもあればtrueを返すのがany?
puts quests.any? { |q| q[:difficulty] == 5}

# 5. 全クエストが未クリアか
# 特に調べてないけどall?と聞いているため配列の要素全てが条件を満たしてないとfalseになるということかな
puts quests.all? { |q| q[:cleared] == false }

# 6. 未クリアのクエスト数
# 数を数えるタイプ。恐らくcountの挙動を見るに条件をブロックで書くと数えてくれそう。やってみよう
puts quests.count { |q| q[:cleared] == false }
