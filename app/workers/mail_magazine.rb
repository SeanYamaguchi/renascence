class MailMagazine < ActionMailer::Base
  default from: "app34862435@heroku.com"
  @queue = :mailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_magazine.send_mail.subject
  #
  def self.send_mail(body, email, title)
      @body = body
      @email = email
      @title = title
      mail(:to => @email, :subject => @title)
  end
end
