FactoryBot.define do
  factory :management_purchase do
    post_code             {"655-0031"}
    area_id               {2}
    city                  {"松山市"}
    adress                {"1-1"}
    phone_number          {"09012345678"}
    building_name         {"ビル"}
              
    token                  {"sk_test_a999aaa6bbb111111cc22d2c"}
  end
end
