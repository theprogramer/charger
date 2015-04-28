module Charger
  class Plan < ActiveRecord::Base

    # Assotiations
    belongs_to :downgrade_to, class_name: "Plan", foreign_key: :downgrade_to_id

    # Interval Unit
    enum interval_unit: [
      :hourly,
      :weekly,
      :fortnightly,
      :monthly,
      :bimonthly,
      :quarterly,
      :semiannually,
      :annually
    ]

    # Validations
    validates_presence_of :name, :amount

  end
end
