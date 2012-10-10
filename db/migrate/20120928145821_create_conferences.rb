class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.datetime :starts_at
      t.string :url

      t.timestamps
    end
  end
end
