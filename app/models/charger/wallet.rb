module Charger
  class Wallet < ActiveRecord::Base
    belongs_to :holder
  end
end
