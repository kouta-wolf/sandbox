# =============================================================
# Day 2（火）— インスタンスメソッド
# テーマ：キャラクターに「行動」を持たせる
# =============================================================
# 【課題】
#   take_damage(amount) と heal(amount) を追加する
#
#   take_damage:
#     @hp を amount だけ減らす
#     0以下になったら0にして "#{name}は倒れた" を puts
#     生きていれば "#{name}のHP: #{hp}" を puts
#
#   heal:
#     @hp を amount だけ増やす（上限なしでOK）
#
# 【確認ポイント】
#   - メソッド内で @hp と hp を使い分けられているか
#   - if / elsif の綴りを正確に書けているか（else if ではない）
# =============================================================

class Character
  attr_reader :name, :hp

  def initialize(name, hp)
    @name = name
    @hp   = hp
  end

  # take_damage(amount) を追加する

  # heal(amount) を追加する
end

hero = Character.new("ボブ", 30)
hero.take_damage(20)   # => ボブのHP: 10
hero.take_damage(15)   # => ボブは倒れた
hero.heal(50)
puts hero.hp           # => 50