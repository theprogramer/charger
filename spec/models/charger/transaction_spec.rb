require 'spec_helper'

module Charger

  RSpec.describe Transaction, type: :model do
    describe "creation" do

      context "valid attributes" do

        it "should be valid" do
          charger_transaction = FactoryGirl.build(:charger_transaction)

          expect(charger_transaction).to be_valid
        end

      end

      context "validations" do
        it { should validate_presence_of :wallet }
        it { should validate_presence_of :date }
      end

      describe "assotiations" do
        it { should belong_to :wallet }
      end
    end
  end

end
