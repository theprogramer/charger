require 'spec_helper'

module Charger
  RSpec.describe Plan, type: :model do

    let(:plan) { FactoryGirl.build :charger_plan }

    describe "creation" do

      context "valid attributes" do

        it "should be valid" do
          charger_plan = FactoryGirl.build(:charger_plan)

          expect(charger_plan).to be_valid
        end

      end

      context "validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :amount }
      end
    end

    describe ".interval" do
      context "should return correct interval" do
        
        it "should return an hour" do
          plan.interval_length = 1
          plan.interval_unit = 0
          expect(plan.interval).to eq(1.hour)
        end

        it "should return one week" do
          plan.interval_length = 1
          plan.interval_unit = 1
          expect(plan.interval).to eq(1.week)
        end

        it "should return 15 days" do
          plan.interval_length = 1
          plan.interval_unit = 2
          expect(plan.interval).to eq(15.days)
        end

        it "should return 1 month" do
          plan.interval_length = 1
          plan.interval_unit = 3
          expect(plan.interval).to eq(1.month)
        end

        it "should return 2 months" do
          plan.interval_length = 1
          plan.interval_unit = 4
          expect(plan.interval).to eq(2.months)
        end

        it "should return 3 months" do
          plan.interval_length = 1
          plan.interval_unit = 5
          expect(plan.interval).to eq(3.months)
        end

        it "should return 6 months" do
          plan.interval_length = 1
          plan.interval_unit = 6
          expect(plan.interval).to eq(6.months)
        end

        it "should return one year" do
          plan.interval_length = 1
          plan.interval_unit = 7
          expect(plan.interval).to eq(1.year)
        end

      end
    end

  end
end
