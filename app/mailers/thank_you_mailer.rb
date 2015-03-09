class ThankYouMailer < ActionMailer::Base
  default from: "info@psara.co.jp"
          cc: "sean@psara.co.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thank_you_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(user)
    @user = user
    mail(to: user.email),
      subject: 'ユーザー登録ありがとうございました。')
  end
end
