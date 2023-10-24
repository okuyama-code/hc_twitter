# frozen_string_literal: true

Rails.logger.debug '==================== user create ===================='

users = [
  {email: 'okuyama@gmail.com', password: '484848', date_of_birth: "1998-01-21", telephone: "09011112222"},
  {email: 'yamada@gmail.com', password: '484848', date_of_birth: "1996-01-01", telephone: "08033334444"},
  {email: 'sato@gmail.com', password: '484848', date_of_birth: "1990-08-01", telephone: "08066668888"},
]

users.each do |user|
  # 一度ユーザーをメールアドレスで検索
  user_data = User.find_by(email: user[:email])
  #　該当ユーザーがいなければ、createする
  if user_data.nil?
    User.create(
      email: user[:email],
      password: user[:password],
      date_of_birth: user[:date_of_birth],
      telephone: user[:telephone]
    )
  end
end
