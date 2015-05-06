module Charger
  class Billing < ActiveRecord::Base

    # Validations
  	validates_presence_of :subscription

    # Assotiations
    belongs_to :subscription

    has_many :transactions

  end
end
