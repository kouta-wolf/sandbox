class Game
  # クラス変数（全インスタンスで共有）
  @@count = 0

  # attr_accessor でゲッター＋セッターを自動生成
  attr_accessor :title, :genre

  # attr_reader でゲッターのみ生成（外から書き換えさせたくない値）
  attr_reader :id

  def initialize(title, genre)
    @@count += 1
    @id    = @@count   # インスタンス変数
    @title = title
    @genre = genre
  end

  # インスタンスメソッド
  def info
    "#{@id}: #{@title} (#{@genre})"
  end

  # クラスメソッド（self. をつける）
  def self.count
    @@count
  end

  # to_s をオーバーライドすると puts で自動で呼ばれる
  def to_s
    info
  end
end

# --- 動作確認 ---
game1 = Game.new("ゼルダの伝説", "アクション")
game2 = Game.new("ドラクエ", "RPG")

puts game1          # to_s が呼ばれる
puts game2

puts Game.count     # クラスメソッド => 2

game1.title = "ゼルダの伝説 ティアキン"  # attr_accessor でセット
puts game1.info
