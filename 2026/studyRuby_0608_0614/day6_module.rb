# =============================================================
# Day 6（土）— モジュールとmixin
# テーマ：複数クラスに共通の振る舞いをモジュールで持たせる
# =============================================================
# 【課題】
#   Loggable モジュールに log メソッドを定義する
#     "[LOG] #{self.class.name}(#{name}): #{message}" を puts する
#
# 【確認ポイント】
#   - include と extend の違いを調べて説明できるか
#   - 継承とmixinを使い分ける基準を自分の言葉で言えるか
# =============================================================

module Loggable
  # log(message) メソッドを定義する
  # "[LOG] #{self.class.name}(#{name}): #{message}" を puts する
end

class Character
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Warrior < Character
  include Loggable

  def initialize(name, weapon)
    super(name)
    @weapon = weapon
  end

  def attack
    msg = "#{@weapon}で攻撃！"
    log(msg)
    msg
  end
end

class Rogue < Character
  include Loggable

  def initialize(name)
    super
  end

  def sneak
    msg = "物陰に隠れた"
    log(msg)
    msg
  end
end

w = Warrior.new("アリス", "ダガー")
r = Rogue.new("カルロス")
w.attack
# => [LOG] Warrior(アリス): ダガーで攻撃！
r.sneak
# => [LOG] Rogue(カルロス): 物陰に隠れた