class InquiryMailer < ActionMailer::Base
  default to: "info@psara.co.jp" 
  default from: "app34862435@heroku.com"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => '#{@inquiry.name} 様お問い合わせありがとうございました。')
  end

end