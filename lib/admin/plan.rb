if defined?(ActiveAdmin)
  
  ActiveAdmin.register Charger::Plan, as: "Plan" do

    # Main menu
    menu parent: "Site"

    # Permit params
    permit_params :name,
                  :description,
                  :enabled,
                  :amount,
                  :interval_length,
                  :interval_unit,
                  :trial_days,
                  :setup_fee,
                  :hold_setup_fee,
                  :billing_cycles,
                  :renew,
                  :downgrade_to

    # Plan form
    form do |f|
      f.inputs "Details" do
        f.input :name
        f.input :description
        f.input :enabled
      end
      f.inputs "Billing" do
      	f.input :amount
      	f.input :interval_length
        f.input :interval_unit, as: :select, collection: Charger::Plan.interval_units.keys.to_a
        f.input :gateway, as: :select, collection: Charger::Gateway.display_descendants
        f.input :trial_days
        f.input :setup_fee
        f.input :hold_setup_fee
        f.input :billing_cycles        
        f.input :renew
        f.input :downgrade_to
      end
      f.actions
    end

    # Plan list
    index do
      selectable_column
      column :name
      column :enabled
      column :amount
      column :interval_length
      column :interval_unit
      column :renew
      column :downgrade_to
      actions
    end

  end

end
