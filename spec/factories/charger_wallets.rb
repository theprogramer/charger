FactoryGirl.define do
  
  sequence :charger_wallet_name do |n|
    "Wallet #{n}"
  end

  factory :charger_wallet, :class => 'Charger::Wallet' do
    name { generate :charger_wallet_name }
    description "MyText"
    total 0
    association :holder, factory: :charger_holder
  end

end
