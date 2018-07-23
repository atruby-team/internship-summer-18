class AddColumnToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :member_count, :integer
  end
end
