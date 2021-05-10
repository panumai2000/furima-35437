FactoryBot.define do
  factory :record_order do
    postal_code {"111-1111"}
    delivery_prefectures_id {2}
    city {"横浜市"}
    address {11}
    phone_number {"09011111111"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
