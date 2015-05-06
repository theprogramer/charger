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
        it { should belong_to :billing }
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

      it "should not count scheduled transactions" do
        
        expect(wallet.total).to eq(0.0)
        transaction = wallet.transactions.build(income: 10.0, date: Time.now)
        expect(transaction).to be_valid
        transaction.save
        expect(wallet.total).to eq(10.0)

        transaction = wallet.transactions.build(expence: 5.0, date: Time.now + 1.day)
        expect(transaction).to be_valid
        transaction.save
        expect(wallet.total).to eq(10.0)

      end

    end

    describe ".initialize_status" do

      let(:wallet) { FactoryGirl.create :charger_wallet }

      it "should initializes the status according to the date" do
        
        transaction = wallet.transactions.build(income: 10.0, date: Time.now)
        expect(transaction).to be_valid
        transaction.save
        expect(transaction.status).to eq("pending")

        transaction = wallet.transactions.build(income: 10.0, date: Time.now + 1.day)
        expect(transaction).to be_valid
        transaction.save
        expect(transaction.status).to eq("scheduled")

      end

    end

    describe "self.update_status" do

      let(:transaction) { FactoryGirl.create :charger_transaction, date: Time.now - 1.day, status: 0 }

      it "should update status according to the date" do

        expect(Transaction.pending.count).to eq(1)
        expect(Transaction.update_status).to eq(1)
        expect(Transaction.pending.count).to eq(0)

      end

    end

  end

end
