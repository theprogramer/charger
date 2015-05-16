require "charger/engine"

module Charger
  
  mattr_accessor :max_transactions_errors

  def self.configure
    yield self
  end

end
