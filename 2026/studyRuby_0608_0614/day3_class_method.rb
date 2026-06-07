# =============================================================
# Day 3（水）— クラスメソッドとself
# テーマ：インスタンスメソッドとクラスメソッドの使い分けを体感する
# =============================================================
# 【課題】
#   self.all      → @@all を返す
#   self.survivors → @@all の中から hp > 0 のものだけ返す
#   to_s          → "#{name}(HP:#{hp})" を返す
#
# 【確認ポイント】
#   - self.method_name と通常メソッド定義の違いを説明できるか
#   - @@（クラス変数）と @（インスタンス変数）の違いを言えるか
# =============================================================

class Character
  @@all = []

  attr_reader :name, :hp

  def initialize(name, hp)
    @name = name
    @hp   = hp
    @@all << self
  end

  # クラスメソッド self.all を定義する

  # クラスメソッド self.survivors を定義する

  # インスタンスメソッド to_s を定義する
end

Character.new("アリス", 100)
Character.new("ボブ", 0)
Character.new("カルロス", 55)

puts Character.all.map(&:to_s).inspect
# => ["アリス(HP:100)", "ボブ(HP:0)", "カルロス(HP:55)"]

puts Character.survivors.map(&:to_s).inspect
# => ["アリス(HP:100)", "カルロス(HP:55)"]