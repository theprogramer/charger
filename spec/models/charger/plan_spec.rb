require 'spec_helper'

module Charger
  RSpec.describe Plan, type: :model do
    describe "creation" do

      context "valid attributes" do

        it "should be valid" do
          charger_plan = FactoryGirl.build(:charger_plan)

          expect(charger_plan).to be_valid
        end

      end
    end
  end
end
