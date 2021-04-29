FactoryBot.define do
  factory :item do
    name                   {"シャツ"}
    introduction   {"おすすめ商品"}
    category_id              {2}
    item_condition_id        {2}
    shipping_free_id         {2}
    area_id                  {2}
    ship_day_id              {2}
    selling_price         {1000} 
    association :user

   after(:build) do |item|
    item.image.attach(io: File.open('public/images/c01_btn.png'), filename: 'c01_btn.png')
  end  
  end
end

