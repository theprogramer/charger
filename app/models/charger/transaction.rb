module Charger
  class Transaction < ActiveRecord::Base

    # Validations
  	validates_presence_of :date
  	validates_presence_of :wallet

  	# Assotiations
    belongs_to :wallet

  end
end
