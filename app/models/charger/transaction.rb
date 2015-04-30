module Charger
  class Transaction < ActiveRecord::Base

    # Validations
  	validates_presence_of :date
  	validates_presence_of :wallet

  	# Assotiations
    belongs_to :wallet

    # Status
    enum status: [
      :completed,
      :refund,
      :placed,
      :canceled,
      :scheduled
    ]

    # Callbacks
    after_save :update_total

    def expences
      Transaction.where(wallet_id: self.wallet, status: Transaction.statuses[:completed]).sum :expence
    end

    def incomes
      Transaction.where(wallet_id: self.wallet, status: Transaction.statuses[:completed]).sum :income
    end

    def update_total
      self.wallet.update_attribute :total, self.incomes - self.expences
    end



  end
end
