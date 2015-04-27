if defined?(ActiveAdmin)
  ActiveAdmin.register Charger::Plan, as: "Plan" do
    menu parent: "Site"
  end
end
