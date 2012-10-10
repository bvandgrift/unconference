class AddStartAndEndTimeToConference < ActiveRecord::Migration
  def change
    rename_column :conferences, :starts_at, :starts_on
    add_column    :conferences, :starts_at, :time
    add_column    :conferences, :ends_at,   :time
  end
end
