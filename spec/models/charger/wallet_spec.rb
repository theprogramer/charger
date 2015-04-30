require 'spec_helper'

module Charger

  RSpec.describe Wallet, type: :model do
    describe "creation" do

      context "valid attributes" do

        it "should be valid" do
          charger_wallet = FactoryGirl.build(:charger_wallet)

          expect(charger_wallet).to be_valid
        end

      end

      context "validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :holder }
      end

      describe "assotiations" do
        it { should belong_to :holder }
        it { should have_many :transactions }
      end

    end

  end

end
