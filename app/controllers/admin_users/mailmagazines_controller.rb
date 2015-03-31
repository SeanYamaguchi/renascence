class AdminUsers::MailmagazinesController < ApplicationController
  before_action :set_admin_users_mailmagazine, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_users_mailmagazines = AdminUsers::Mailmagazine.all
    respond_with(@admin_users_mailmagazines)
  end

  def show
    respond_with(@admin_users_mailmagazine)
  end

  def new
    @admin_users_mailmagazine = AdminUsers::Mailmagazine.new

    @users = User.all 
    @users.each do |u|
      if /('購読する')/ === "#{u.magazine}"
        MailMagazine.enqueue.send_mail(@admin_users_mailmagazine.body, u.email, @admin_users_mailmagazine.title)
      else
      end
    end
    respond_with(@admin_users_mailmagazine)
  end

  def edit
  end

  def create
    @admin_users_mailmagazine = AdminUsers::Mailmagazine.new(admin_users_mailmagazine_params)
    @admin_users_mailmagazine.save
    respond_with(@admin_users_mailmagazine)
  end

  def update
    @admin_users_mailmagazine.update(mailmagazine_params)
    respond_with(@admin_users_mailmagazine)
  end

  def destroy
    @admin_users_mailmagazine.destroy
    respond_with(@admin_users_mailmagazine)
  end

  private
    def set_admin_users_mailmagazine
      @admin_users_mailmagazine = AdminUsers::Mailmagazine.find(params[:id])
    end

    def admin_users_mailmagazine_params
      params[:admin_users_mailmagazine].permit(:title, :body)
    end
end
