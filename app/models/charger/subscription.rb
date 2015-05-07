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
                                                expence: self.calculate_amount,
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

    def calculate_amount
      amount = 0
      case self.billings_count
      when 0
        # On Subscribe!
        # If hold setup fee
        amount += self.plan.setup_fee if self.plan.hold_setup_fee
        # If have trial days
        amount += self.plan.amount unless self.plan.trial_days < 0
      #Infinity
      #when 1..(1.0/0.0)
      else
        # Recurring payments
        amount += self.plan.amount
      end
    end

    def calculate_next_due
      case self.billings_count
      when 0
        # On Subscribe!
        # If have trial days
        Time.now + (self.plan.trial_days).days unless self.plan.trial_days < 0
      else
        # Recurring payments
        self.last_payment_at + self.plan.interval
      end
    end

  end
end
