require 'spec_helper'

module Charger
  RSpec.describe Subscription, type: :model do
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

  end
end
