require "charger/engine"

module Charger
  
  mattr_accessor :max_transactions_errors

  mattr_accessor :subscriber_class

  def self.configure
    yield self
  end

end
