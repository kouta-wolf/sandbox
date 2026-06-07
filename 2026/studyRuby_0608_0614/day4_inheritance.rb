# =============================================================
# Day 4（木）— 継承の基本
# テーマ：職業（ウォリアー・メイジ）を継承で表現する
# =============================================================
# 【課題】
#   Warrior クラスを Character を継承して作る
#     - initialize に weapon(武器名) を追加で受け取る
#     - super で親の initialize を呼ぶ
#     - attack メソッド: "#{name}は#{weapon}で攻撃！" を返す
#
#   Mage クラスを Character を継承して作る
#     - initialize に spell(呪文名) を追加で受け取る
#     - cast メソッド: "#{name}は#{spell}を唱えた！MP-10" を返す
#       （@mp を 10 減らす処理も入れる）
#
# 【確認ポイント】
#   - super を引数ありで呼ぶ理由を説明できるか
#   - 子クラスで status を呼べる理由を言えるか
# =============================================================

class Character
  attr_reader :name, :hp, :mp

  def initialize(name, hp, mp)
    @name = name
    @hp   = hp
    @mp   = mp
  end

  def status
    "#{name} HP:#{hp} MP:#{mp}"
  end
end

# Warrior クラスを定義する

# Mage クラスを定義する

w = Warrior.new("アリス", 120, 20, "ブロードソード")
m = Mage.new("ボブ", 60, 80, "ファイアボール")

puts w.attack   # => アリスはブロードソードで攻撃！
puts m.cast     # => ボブはファイアボールを唱えた！MP-10
puts m.status   # => ボブ HP:60 MP:70