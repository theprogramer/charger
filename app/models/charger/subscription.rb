module Charger
  class Subscription < ActiveRecord::Base

  	# Validations
  	validates_presence_of :plan
  	validates_presence_of :subscriber

  	# Assotiations
    belongs_to :plan
    belongs_to :subscriber, polymorphic: true

    # Generate a Billing
    def charge
      #self.subscrib
    end

  end
end
