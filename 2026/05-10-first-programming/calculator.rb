# frozen_string_literal: true

# 税率計算を考慮した計算を行うクラス
class PriceCalculator
  TAX_RATES = { normal: 0.10, reduced: 0.08 }.freeze

  def self.calculate(items)
    sub_total = 0
    tax_total = 0

    items.each do |item|
      rate = TAX_RATES[item[:category]]
      sub_total += item[:price]
      tax_total += (item[:price] * rate).floor
    end

    total_with_tax = sub_total + tax_total
    total_with_tax -= 500 if total_with_tax >= 5000

    { total: total_with_tax }
  end
end
