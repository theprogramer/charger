FactoryGirl.define do

  factory :charger_billing, :class => 'Charger::Billing' do
  	
  	amount 0
  	description "Nope"
  	observation "Nope"

  	status 0

  	association :subscription, factory: :charger_subscription
    
  end

end
