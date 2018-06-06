class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Bienvenue à la MEI')
    # This will render a view in `app/views/user_mailer`!
  end

  def newcour(cour)
    @cour = cour
    @user = @cour.student.user
    mail(to: @user.email, subject: 'Pré-inscription à un cour')
  end
end
