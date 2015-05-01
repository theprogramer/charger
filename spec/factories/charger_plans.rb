FactoryGirl.define do
  
  sequence :charger_plan_name do |n|
    "Plan #{n}"
  end

  factory :charger_plan, :class => 'Charger::Plan' do
    name { generate :charger_plan_name }
    description "MyText"
    slug "plan"
    amount { [15.0, 25.0, 35.0].sample }
    interval_length 1
    interval_unit 1
    setup_fee 0.0
    renew true
    billing_cycles 0
    trial_days 0
    hold_setup_fee false
    enabled true
    # max
    # max_qty
    downgrade_to nil
  end

end
