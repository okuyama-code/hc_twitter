# frozen_string_literal: true

Rails.logger.debug '==================== user create ===================='

users = [
  { name: '奥山', email: 'okuyama@gmail.com', password: '484848', date_of_birth: '1998-01-21', telephone: '09011112222',
    username: 'okuyama01' },
  { name: '山田', email: 'yamada@gmail.com', password: '484848', date_of_birth: '1996-01-01', telephone: '08033334444',
    username: 'yamada01' },
  { name: '佐藤', email: 'sato@gmail.com', password: '484848', date_of_birth: '1990-08-01', telephone: '08066668888',
    username: 'sato01' }
]

user1 = nil
user2 = nil
user3 = nil

users.each do |user|
  # 一度ユーザーをメールアドレスで検索
  user_data = User.find_by(email: user[:email])
  # 該当ユーザーがいなければ、createする
  next unless user_data.nil?

  created_user = User.create(
    name: user[:name],
    email: user[:email],
    password: user[:password],
    date_of_birth: user[:date_of_birth],
    telephone: user[:telephone],
    username: user[:username]
  )

  # 作成したユーザーをそれぞれの変数に割り当てまる
  case user[:email]
  when 'okuyama@gmail.com'
    user1 = created_user
  when 'yamada@gmail.com'
    user2 = created_user
  when 'sato@gmail.com'
    user3 = created_user
  end
end

user1.image.attach(io: File.open(Rails.root.join('app/assets/images/EC1.jpg')), filename: 'EC1.jpg')
user1.save!

user2.image.attach(io: File.open(Rails.root.join('app/assets/images/EC2.jpg')), filename: 'EC2.jpg')
user2.save!

user3.image.attach(io: File.open(Rails.root.join('app/assets/images/EC3.jpg')), filename: 'EC2.jpg')
user3.save!

# user1、user2、user3 にそれぞれのユーザー レコードが含まれる

# users = [
#   {email: 'okuyama@gmail.com', password: '484848', date_of_birth: "1998-01-21", telephone: "09011112222"},
#   {email: 'yamada@gmail.com', password: '484848', date_of_birth: "1996-01-01", telephone: "08033334444"},
#   {email: 'sato@gmail.com', password: '484848', date_of_birth: "1990-08-01", telephone: "08066668888"},
# ]

# users.each do |user|
#   # 一度ユーザーをメールアドレスで検索
#   user_data = User.find_by(email: user[:email])
#   #　該当ユーザーがいなければ、createする
#   if user_data.nil?
#     User.create(
#       email: user[:email],
#       password: user[:password],
#       date_of_birth: user[:date_of_birth],
#       telephone: user[:telephone]
#     )
#   end
# end
