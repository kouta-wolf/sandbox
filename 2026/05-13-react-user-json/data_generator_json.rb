# frozen_string_literal: true

require 'faker'

Faker::Config.locale = :ja

# 架空のuserデータとorderデータを作るクラス
class DataGenerator
  def self.generate_users(count)
    Faker::UniqueGenerator.clear

    (1..count).map do |i|
      {
        id: i,
        username: Faker::JapaneseMedia::Naruto.unique.character,
        email: Faker::Internet.email(name: "user#{i}", domain: 'example.com'),
        phone: "090-0000-#{Faker::Number.number(digits: 4)}",
        address: "架空県#{Faker::Address.city}"
      }
    end
  end

  def self.generate_orders(users, total_count = 50)
    (1..total_count).map do |i|
      random_user = users.sample

      {
        id: i,
        user_id: random_user[:id],
        category: %w[食品 家電 書類 衣類 美容].sample,
        amount: Faker::Number.between(from: 500, to: 20_000),
        ordered_at: Faker::Date.backward(days: 30)
      }
    end
  end
end
