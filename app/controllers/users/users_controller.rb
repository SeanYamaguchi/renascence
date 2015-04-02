class Users::UsersController < ActionController::Base
  def index
    @users = User.all
  end

   def show
    Resque.enqueue(Mylogger, params[:name])
    render :text => params[:name]
  end
end