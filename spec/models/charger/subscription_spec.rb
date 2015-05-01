require 'spec_helper'

module Charger
  RSpec.describe Subscription, type: :model do

    let(:subscription) { FactoryGirl.create :charger_subscription }

    describe "creation" do

      context "valid attributes" do

        it "should be valid" do
          charger_subscription = FactoryGirl.build(:charger_subscription)

          expect(charger_subscription).to be_valid
        end

      end

      context "validations" do
        it { should validate_presence_of :plan }
        it { should validate_presence_of :subscriber }
      end
    end

    describe ".charge" do
      
    end

    describe ".bill" do

      it "should generate a new transaction" do
        subscription.bill
        expect(subscription.subscriber.default_wallet.transactions.count).to eq(1)
        expect(subscription.subscriber.default_wallet.total * (-1)).to eq(subscription.plan.amount)
      end

    end

  end
end
