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
  # 昨日の復習 initializeで初期化、attr_readerで外から呼び出し
  attr_reader :name, :hp

  def initialize(name, hp)
    @name = name
    @hp   = hp
  end

  # take_damage(amount) を追加する
  def take_damage(amount)
    # initializeによって@nameの@hpはボブのhpになる
    # その上で-=によって@hp = @hp - amountを省略できる
    # やってることは引数分のダメージをマイナスして@hpに代入
    @hp -= amount    

    # 後置ifにすることで可読性の向上を狙う…が読みづらい？
    # やってることはhpが0以下ならhp=0にするという処理にしつつ
    # 文字を出力する…うーん…個人的にやることは2つあるからきついのかな
    puts "#{@name}は倒れた" if @hp < 0 && @hp = 0

    # ボブが倒れてないなら残りHPを表示するという方法を取った
    puts "#{@name}のHP: #{@hp}" if @hp > 0
  end

  # heal(amount) を追加する
  # 回復するだけなので出力には反映しない。
  def heal(amount)
    @hp += amount
  end
end

hero = Character.new("ボブ", 30)
hero.take_damage(20)   # => ボブのHP: 10
hero.take_damage(15)   # => ボブは倒れた
hero.heal(50)
puts hero.hp           # => 50
