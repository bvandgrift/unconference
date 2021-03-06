class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id

      t.timestamps
    end

    add_index :registrations, [:provider, :uid]
    add_index :registrations, :user_id
  end
end
