FactoryGirl.define do
  factory :charger_transaction, :class => 'Charger::Transaction' do
    wallet nil
description "MyText"
date "2015-04-28 13:48:18"
expence "9.99"
income "9.99"
status 1
  end

end
