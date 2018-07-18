class ChangeGenderToUsers < ActiveRecord::Migration[5.1]
  def up
    User.where(gender: 'nam').update_all(gender: 0)
    User.where(gender: 'nu').update_all(gender: 1)
    User.where(gender: 'khac').update_all(gender: 2)
    change_column :users, :gender, 'integer USING CAST(gender AS integer)'
  end

  def down
    change_column :users, :gender, :string
    User.where(gender: 0).update_all(gender: 'nam')
    User.where(gender: 1).update_all(gender: 'nu')
    User.where(gender: 2).update_all(gender: 'khac')
  end
end
