class User < ActiveRecord::Base
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :users_user_profiles_avatars
  has_and_belongs_to_many :communities
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable, :confirmable,
         :omniauthable, omniauth_providers: [:twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  	  user.email = auth.info.email
  	end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  	  new(session["devise.user_attributes"], without_production: true) do |user|
  	  	user.attributes = params
  	  	user.valid?
  	  end
  	else
  	  super
  	end
  end

  def password_required?
  	super && provider.blank?
  end

  def update_with_password(params, *options)
  	if encrypted_password.blank?
  	  update_attributes(params, *options)
  	else
      super
    end
  end
end
