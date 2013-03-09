class UserMailer < ActionMailer::Base
  default from: "carbongroove1871@gmail.com"

  def login_confirmation(user)
    @user = user
    mail to: "carbongroove1871@gmail.com", subject: 'Hey Hey Hey'
  end
end
