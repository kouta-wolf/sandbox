# frozen_string_literal: true

# ショッピングカートの価格計算を行うクラス
class SalesAnalytics
  def self.total_revenue(orders)
    total = 0
    orders.each do |order|
      total += order[:amount].to_i
    end
    total
  end

  def self.revenue_by_category(orders)
    result = Hash.new(0)
    orders.each do |order|
      category = order[:category]
      amount = order[:amount].to_i
      result[category] += amount
    end
    result
  end

  # numは順位の数
  def self.top_customer_ids(orders, num)
    valid_orders = orders.reject { |o| o[:amount].nil? }
    sorted_orders = valid_orders.sort_by { |o| o[:amount] }.reverse
    top_orders = sorted_orders.first(num)
    top_orders.map { |o| o[:user_id] }
  end

  def self.average_order_value(orders)
    valid_orders = orders.reject { |o| o[:amount].nil? }
    return 0 if valid_orders.empty?

    total = valid_orders.sum { |o| o[:amount] }
    total / valid_orders.length
  end
end
