require_relative '../expenses'

RSpec.describe SalesAnalytics do

  let(:normal_orders) do
    [
      { user_id: 1, amount: 1000, category: "食品" },
      { user_id: 2, amount: 5000, category: "家電" },
    ]
  end

  let(:nil_orders) do
    [
      { user_id: 1, amount: 1000, category: "食品" },
      { user_id: 2, amount: nil, category: "家電" },
      { user_id: 3, amount: 10000, category: "美容" },
    ]
  end

  describe ".total_revenue" do
    context "データが存在する場合" do
      it "全ての注文の合計金額を返すこと" do
        expect(SalesAnalytics.total_revenue(normal_orders)).to eq 6000
      end
    end

    context "amountデータが空の場合" do
      it "0を返すこと" do
        expect(SalesAnalytics.total_revenue([])).to eq 0
      end
    end

    context "amountデータが一部nilの場合" do
      it "nilを無視して計算すること" do
        expect(SalesAnalytics.total_revenue(nil_orders)).to eq 11000
      end
    end
  end
  
  describe ".revenue_by_category" do
    it "カテゴリごとの合計金額のハッシュを返すこと" do
      result = SalesAnalytics.revenue_by_category(normal_orders)
      expect(result["食品"]).to eq 1000
      expect(result["家電"]).to eq 5000
    end
  end

  describe ".top_customer_ids" do
    it "購入金額が高い順に指定した人数分のIDを返すこと" do
      expect(SalesAnalytics.top_customer_ids(normal_orders, 2)).to eq [2, 1]
    end

    context "指定した人数より顧客が少ない場合" do
      it "存在する顧客のみを返すこと" do
        expect(SalesAnalytics.top_customer_ids(normal_orders, 10)).to have_attributes(size: 2)
      end
    end
  end
  
  describe ".average_order_value" do
    it "平均注文額を正しく計算すること" do
      expect(SalesAnalytics.average_order_value(normal_orders)).to eq 3000
    end

    context "データが空の場合" do
      it "0を返し、0除算エラーが発生しないこと" do
        expect(SalesAnalytics.average_order_value([])).to eq 0
      end
    end

    context "amountデータの一部がnilの場合" do
      it "nilを無視して計算を実施すること" do
        expect(SalesAnalytics.average_order_value(nil_orders)).to eq 5500
      end
    end
  end
end
