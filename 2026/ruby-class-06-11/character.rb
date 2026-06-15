require_relative 'actor'

class Character < Actor
  def initialize(name, hp, atk, lv)
    super(name, hp, atk)
    @lv = lv
  end

  def info
    puts "名前: #{@name}, HP: #{@hp}, 攻撃力: #{@atk}, レベル: #{@lv}"
  end
end
