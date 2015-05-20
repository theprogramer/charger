require 'spec_helper'

module Charger
  
  RSpec.describe Billing, type: :model do
    describe "creation" do

      context "valid attributes" do

        it "should be valid" do
          charger_billing = FactoryGirl.build(:charger_billing)

          expect(charger_billing).to be_valid
        end

      end

      context "validations" do
        it { should validate_presence_of :subscription }
      end

      describe "assotiations" do
        it { should belong_to :subscription }
        it { should have_many :transactions }
      end

    end

    describe ".reject!" do

      pending "Pending!"

    end

  end

end
