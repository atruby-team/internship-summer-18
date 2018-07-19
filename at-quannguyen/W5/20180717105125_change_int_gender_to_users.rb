class ChangeIntGenderToUsers < ActiveRecord::Migration[5.1]
  def up
    User.where(gender: 'nam').update_all(gender: 0)
    User.where(gender: 'nu').update_all(gender: 1)
    User.where(gender: 'gioi tinh khac').update_all(gender: 2)
    change_column :users, :gender, :integer, limit: 1
  end

  def down
    change_column :users, :gender, :string
    User.where(gender: 0).update_all(gender: 'nam')
    User.where(gender: 1).update_all(gender: 'nu')
    User.where(gender: 2).update_all(gender: 'gioi tinh khac')
  end
end
