class UserMailer < ActionMailer::Base
  default from: "carbongroove1871@gmail.com"

  def login_confirmation(user)
    @user = user
    mail to: user.email, subject: 'Hey Hey Hey'
  end
end
