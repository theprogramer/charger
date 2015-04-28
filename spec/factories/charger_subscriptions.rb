FactoryGirl.define do

  factory :charger_subscription, :class => 'Charger::Subscription' do

    status 0
    billings_count 0
    
    first_payment_at Time.now
    last_payment_at Time.now

    association :plan, factory: :charger_plan
    association :subscriber, factory: :charger_holder

  end

end
