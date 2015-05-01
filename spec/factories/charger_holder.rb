FactoryGirl.define do

  sequence :charger_holder_email do |n|
    "holder#{n}@holder.com"
  end

  factory :charger_holder, class: 'User' do
    email { generate :charger_holder_email }
    password "1q2w3e4r5t"
    after(:create) do |holder|
      FactoryGirl.create_list(:charger_wallet, 1, holder: holder)
    end
  end

end
