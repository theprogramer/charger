module Charger::Subscribed
  
  extend ActiveSupport::Concern

  included do
    has_many :subscriptions,
             as: :subscriber,
             dependent: :destroy,
             class_name: "Charger::Subscription"
    has_many :wallets,
             as: :holder,
             dependent: :destroy,
             class_name: "Charger::Wallet"
  end

  def default_wallet
    self.wallets.first
  end


  # methods defined here are going to extend the class, not the instance of it
  #module ClassMethods
  
  #end

end