class Actor
  def initialize(name, hp, atk)
    @name = name
    @hp = hp
    @atk = atk
  end

  def info
    puts "名前: #{@name}, HP: #{@hp}, 攻撃力: #{@atk}"
  end
end
