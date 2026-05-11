require_relative '../calculator'

RSpec.describe PriceCalculator do
  it "軽減税率が正しく適用されること" do
    items = [
      { name: "本", price: 1000, category: :normal }, # 税100
      { name: "りんご", price: 100, category: :reduced } # 税8
    ]
    result = PriceCalculator.calculate(items)
    expect(result[:total]).to eq 1208
  end

  it "5000円以上のときに500円割引されること" do
    items = [
      { name: "ゲームソフト", price: 5000, category: :normal } # 税 500
    ]
    result = PriceCalculator.calculate(items)
    expect(result[:total]).to eq 5000 # 税込み5500 - 割引 = 5000
  end
end
