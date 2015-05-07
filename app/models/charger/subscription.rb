module Charger
  class Subscription < ActiveRecord::Base

  	# Validations
  	validates_presence_of :plan
  	validates_presence_of :subscriber

    # Status
    enum status: [
      :enabled,
      :disabled,
      :canceled
    ]

  	# Assotiations
    belongs_to :plan
    belongs_to :subscriber, polymorphic: true

    has_many :billings

    # Generate a Billing
    def charge
      #self.subscrib
    end

    # Generate a new Billing
    def bill
      wallet = self.subscriber.default_wallet
      transaction = wallet.transactions.build(
                                                date: Time.now,
                                                expence: self.plan.amount,
                                                description: self.plan.name
                                              ).save
      billing = self.billings.build(
                                      amount: wallet.total,
                                      description: "Test"
                                    ).save
      wallet.transactions.pending.update_all billing_id: billing
    end

    def downgrade!
      self.update plan_id: self.plan.downgrade_to
    end

  end
end
