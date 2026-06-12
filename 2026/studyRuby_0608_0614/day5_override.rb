# =============================================================
# Day 5（金）— メソッドのオーバーライド
# テーマ：親の status を子クラスで上書きする
# =============================================================
# 【課題】
#   Warrior の status をオーバーライドする
#     出力例: "アリス HP:120 MP:20 [武器:ブロードソード]"
#     ヒント: super を使って親の status を再利用する
#
#   Mage の status をオーバーライドする
#     出力例: "ボブ HP:60 MP:70 [呪文:ファイアボール]"
#
# 【確認ポイント】
#   - super を引数なしで呼ぶとどうなるか説明できるか
#   - オーバーライドと新規メソッド追加の違いを言えるか
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

class Warrior < Character
  def initialize(name, hp, mp, weapon)
    super(name, hp, mp)
    @weapon = weapon
  end

  def attack
    "#{name}は#{@weapon}で攻撃！"
  end

  def status
    # 親クラスと同名のメソッドは引数を入れずにsuperする場合はそのまま親のメソッドを引き継ぐことができる
    # 新規メソッド追加の場合は上のinitializeのように引数つきsuperで一部を引き継ぐことができる。また処理をさらに追加することができる
    "#{super} [武器:#{@weapon}]"
  end
end

class Mage < Character
  def initialize(name, hp, mp, spell)
    super(name, hp, mp)
    @spell = spell
  end

  def cast
    @mp -= 10
    "#{name}は#{@spell}を唱えた！MP-10"
  end

  def status
    "#{super} [呪文:#{@spell}]"
  end
end

w = Warrior.new("アリス", 120, 20, "ブロードソード")
m = Mage.new("ボブ", 60, 80, "ファイアボール")
m.cast

puts w.status
# => アリス HP:120 MP:20 [武器:ブロードソード]

puts m.status
# => ボブ HP:60 MP:70 [呪文:ファイアボール]
