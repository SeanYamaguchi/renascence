# Preview all emails at http://localhost:3000/rails/mailers/thank_you_mailer
class ThankYouMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/thank_you_mailer/sendmail_confirm
  def sendmail_confirm
    ThankYouMailer.sendmail_confirm
  end

end
