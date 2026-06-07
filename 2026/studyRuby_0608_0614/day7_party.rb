# =============================================================
# Day 7（日）— 週のまとめ：小さく組み合わせる
# テーマ：今週学んだ要素を全部使ってパーティー管理クラスを作る
# =============================================================
# 【課題】
#   Party クラスを自由に実装する
#     - add(character)  でメンバーを追加する
#     - status_all      で全員の status を出力する
#     - alive_count     で hp > 0 の人数を返す
#     - wipe_out?       で全員 hp <= 0 なら true を返す
#
#   Day1〜6 で作ったクラスを使ってOK
#   Loggable を Party にも include してみる
#
# 【確認ポイント】
#   - 今週書いたコードを見返して「ここはなぜこう書いたか」を3箇所説明できるか
#   - 詰まった部分・ミスしやすかった構文をメモする
# =============================================================

module Loggable
  def log(message)
    puts "[LOG] #{self.class.name}(#{name}): #{message}"
  end
end

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
  include Loggable

  def initialize(name, hp, mp, weapon)
    super(name, hp, mp)
    @weapon = weapon
  end

  def attack
    "#{name}は#{@weapon}で攻撃！"
  end

  def status
    "#{super} [武器:#{@weapon}]"
  end
end

class Mage < Character
  include Loggable

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

class Rogue < Character
  include Loggable

  def initialize(name, hp = 70, mp = 30)
    super(name, hp, mp)
  end

  def sneak
    "#{name}は物陰に隠れた"
  end
end

# Party クラスを定義する

party = Party.new("冒険者ギルド")
party.add(Warrior.new("アリス", 100, 20, "ソード"))
party.add(Mage.new("ボブ", 60, 80, "ブリザード"))
party.add(Rogue.new("カルロス"))

party.status_all
puts party.alive_count   # => 3
puts party.wipe_out?     # => false