class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
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

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:magazine, :email, :password, :password_confirmation) }
  end
end
