class AddMembersCount < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :members_count, :integer, default: 0
  end
end
