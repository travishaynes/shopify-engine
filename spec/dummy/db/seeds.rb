puts "Creating plans"
Plan.create! :name => 'basic',    :cost => 5.00,  :trial_days => 30
Plan.create! :name => 'standard', :cost => 10.00, :trial_days => 15
Plan.create! :name => 'pro',      :cost => 15.00, :trial_days => 0
