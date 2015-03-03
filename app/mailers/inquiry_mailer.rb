class InquiryMailer < ActionMailer::Base
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'お問い合わせを承りました', from: "#{@inquiry.email}", to: "shion.yamaguchi.shion@gmail.com")
  end
 
end