FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    item_name {"ジャケット"}
    description {"2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。"}
    category_id {2}
    status_id {2}
    delivery_burden_id {2}
    delivery_prefectures_id {2}
    delivery_days_id {2}
    price {300}
    association :user 
  end
end

