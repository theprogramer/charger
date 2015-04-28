module Charger
  class Transaction < ActiveRecord::Base
    belongs_to :wallet
  end
end
