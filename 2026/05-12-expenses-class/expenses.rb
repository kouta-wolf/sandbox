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

  def self.top_customer_ids(orders, num) # numは順位の数
    valid_orders = orders.select { |o| !o[:amount].nil? }
    sorted_orders = valid_orders.sort_by { |o| o[:amount] }.reverse
    top_orders = sorted_orders.first(num)
    result = top_orders.map { |o| o[:user_id] }
    result
  end

  def self.average_order_value(orders)
    valid_orders = orders.select { |o| !o[:amount].nil? }
    return 0 if valid_orders.empty?
    
    total = valid_orders.sum { |o| o[:amount] }
    avg = total / valid_orders.length
  end
end
