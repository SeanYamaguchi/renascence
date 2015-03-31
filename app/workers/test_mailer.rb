class TestMailer

  @queue = :default
  
  def sent_mag(body, email, title)
      @body = body
      @email = email
      @title = title
      mail(:to => @email, :subject => @title)
  end
end
