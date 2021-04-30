FactoryBot.define do
  factory :item do
    item_name           {"あああああああ"}
    item_description    {"いいいいいいいいい"}
    category_id         {2}
    condition_id        {2}
    burden_id           {2}
    area_id             {2}
    days_id             {2}
    price               {1000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
