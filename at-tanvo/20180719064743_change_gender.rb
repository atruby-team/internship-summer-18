class ChangeGender < ActiveRecord::Migration[5.2]
  def up
    User.where(gender: 'nam').update_attribute!(gender: '0')
    User.where(gender: 'nu').update_attribute!(gender: '1')
    User.where(gender: 'khac').update_attribute!(gender: '2')
    change_column :users, :gender, :tinyint
  end

  def down
    change_column :users, :gender, :string
    User.where(gender: '0').update_attribute!(gender: 'nam')
    User.where(gender: '1').update_attribute!(gender: 'nu')
    User.where(gender: '2').update_attribute!(gender: 'khac')
  end
end
