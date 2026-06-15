require_relative 'character'

class Hero < Character
  def initialize(name, hp, atk, lv)
    super(name, hp, atk, lv)
    @roll = "勇者"
  end

  def info
    puts "職業: #{@roll}, 名前: #{@name}, HP: #{@hp}, 攻撃力: #{@atk}, レベル: #{@lv}"
  end
end

hero1 = Hero.new("ヒロ", 50, 10, 20)
hero1.info
