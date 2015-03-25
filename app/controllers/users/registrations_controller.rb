class Users::RegistrationsController < Devise::RegistrationsController
	def new

		super

		#@mail = ThankYouMailer.sendmail_confirm(user).deliver
		#render text: "メールは正しく送信されました"
	end

  def edit
    super
  end

  def show
    super
  end

  def create
    super
  end
 
  def destroy
    super
  end
end
