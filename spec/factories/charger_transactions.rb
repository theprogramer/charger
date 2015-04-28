FactoryGirl.define do
  factory :charger_transaction, :class => 'Charger::Transaction' do

    description "Nope"
    date Time.now
    expence 0
    income 0
    status 0

    association :wallet, factory: :charger_wallet

  end

end
