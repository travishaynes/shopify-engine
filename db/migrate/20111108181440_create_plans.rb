class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string  :name
      t.decimal :cost
      t.integer :trial_days, :default => 0
      
      t.timestamps
    end
  end
end
