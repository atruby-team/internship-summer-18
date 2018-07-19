class InsertTableUser < ActiveRecord::Migration[5.1]
  def change
    10.times do |n|
      email = "test-#{n + 1}@gmail.com"
      password = 'password'
      User.create!(email: email,
                   password: password,
                   single: true,
                   gender: 0)
    end

    users = User.order(:created_at).take(6)

    users.each do |user|
      content = Faker::Lorem.sentence(5)
      user.create_team!(name: content)
    end
  end
end
