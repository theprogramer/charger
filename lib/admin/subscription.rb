if defined?(ActiveAdmin)
  
  ActiveAdmin.register Charger::Subscription, as: "Subscription" do

    # Main menu
    menu parent: "Site"

    # Permit params
    permit_params :subscriber,
                  :plan,
                  :status

    # Plan form
    form do |f|
      f.inputs "Details" do
        f.input :subscriber, as: :select, collection: Charger.subscriber_class.constantize.all
        f.input :plan
        f.input :status
      end
      f.actions
    end

    # Plan list
    index do
      selectable_column
      column :subscriber
      column :plan
      column :status
      column :billings_count
      column :first_payment_at
      column :last_payment_at
      actions
    end

  end

end
