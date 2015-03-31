# Preview all emails at http://localhost:3000/rails/mailers/mail_magazine
class MailMagazinePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_magazine/send_mail
  def send_mail
    MailMagazine.send_mail
  end

end
