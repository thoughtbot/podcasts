class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_or_create_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    User.where(:email => data['email']).first || create_for_thoughtbot_user(data)
  end

  private

  def self.create_for_thoughtbot_user(data)
    if thoughtbot_user?(data)
      User.create(email: data['email'], password: generate_password)
    end
  end

  def self.thoughtbot_user?(data)
    data['email'].ends_with?('@thoughtbot.com')
  end

  def self.generate_password
    Devise.friendly_token[0,20]
  end
end
