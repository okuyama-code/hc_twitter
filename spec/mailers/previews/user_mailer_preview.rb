# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_user_email
  def new_user_email
    user = User.new(email: 'pre@gmail.com', password: '484848', date_of_birth: '1998-01-21', telephone: '09011112222')
    UserMailer.new_user_email(user)
  end
end
