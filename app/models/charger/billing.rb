module Charger
  class Billing < ActiveRecord::Base

    # Validations
  	validates_presence_of :subscription

    # Assotiations
    belongs_to :subscription

    has_many :transactions

    # Status
    enum status: [
      :pending,
      :completed,
      :refund,
      :placed,
      :canceled,
      :scheduled,
      :rejected
    ]

    #
    def self.process_all
      Billing.pending.all.each do |billing|
      	if billing.gateway.empty?
      	  self.reject!
      	else
      	end
      end
    end

    #
    def reject!
      self.update_attribute :status, Billing.statuses[:rejected]
      self.subscription.update_attribute :rejects_count, self.subscription.rejects_count + 1
      billing = self.dup
      billing.subscription = self.subscription
      billing.save
    end

  end
end

