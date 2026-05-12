# Rubyで作る集計クラスを使用したDB操作

### 目的
- ビッグデータでのデータ分析はSQLを使うのがベターではある
- ただRubyで作る場合の挙動をどうするかという練習のために作成

### 仕様
ハッシュの配列（`[{user_id: 1, amount: 1000, category: "食品"}, ...]`）を受け取り、以下の統計情報を算出する。

- `total_revenue(orders)`: 全注文の合計金額を算出する。金額が`nil`のデータは除外して計算する。
- `revenue_by_category(orders)`: カテゴリをキー、その合計金額を値としたハッシュを返す。
- `top_customer_ids(orders, num)`: 購入金額の合計が高い順に、指定した人数分（`num`）のユーザーIDを配列で返す。
- `average_order_value(orders)`: 1注文あたりの平均額を算出する。データが空の場合や金額が`nil`の場合でも、0除算エラーを回避し正しい分母で計算する。

### 実行方法
```bash
# RSpecのインストール
$ gem install rspec

# テストの実行
$ rspec spec/expenses_spec.rb --format documentation
```

### 学んだ点
- ハッシュの初期値設定:`Hash.new(0)`を使うことで存在しないキーに対して加算する際の`nil + 数値`によるエラーを防ぎコードを簡潔に書くことができた。
- データ欠損への対策: 
  - `to_i`を使って`nil`を`0`として扱う方法。
  - `select`や`compact`を使って、計算前に不適切なデータを除外する方法。
- Rubyの標準メソッドの柔軟性:`first(num)`や`max_by(num)`は、実際の要素数より大きい数字を渡してもエラーにならない（取れる分だけ受け取る便利さ）
- ゼロ除算の回避: 平均値を出す際など分母が0になる可能性がある場合は、事前に `return 0 if orders.empty?` のようなガード句を入れる重要性を理解

### テストケース
SalesAnalytics
  .total_revenue
    データが存在する場合
      全ての注文の合計金額を返すこと
    amountデータが空の場合
      0を返すこと
    amountデータが一部nilの場合
      nilを無視して計算すること
  .revenue_by_category
    カテゴリごとの合計金額のハッシュを返すこと
  .top_customer_ids
    購入金額が高い順に指定した人数分のIDを返すこと
    指定した人数より顧客が少ない場合
      存在する顧客のみを返すこと
  .average_order_value
    平均注文額を正しく計算すること
    データが空の場合
      0を返し、0除算エラーが発生しないこと
    amountデータの一部がnilの場合
      nilを無視して計算を実施すること
