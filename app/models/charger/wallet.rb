module Charger
  class Wallet < ActiveRecord::Base

    # Validations
  	validates_presence_of :name
  	validates_presence_of :holder

    # Assotiations
    belongs_to :holder, polymorphic: true

    has_many :transactions

  end
end
