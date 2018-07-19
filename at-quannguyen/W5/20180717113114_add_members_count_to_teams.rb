class AddMembersCountToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :members_count, :integer
  end
end
