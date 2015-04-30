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

    describe ".update_total" do

      let(:wallet) { FactoryGirl.create :charger_wallet }

      it "should update wallet total" do
        
        expect(wallet.total).to eq(0.0)
        transaction = wallet.transactions.build(income: 10.0, date: Time.now)
        expect(transaction).to be_valid
        transaction.save
        expect(wallet.total).to eq(10.0)
        transaction = wallet.transactions.build(expence: 5.0, date: Time.now)
        expect(transaction).to be_valid
        transaction.save
        expect(wallet.total).to eq(5.0)

      end

    end

  end

end
