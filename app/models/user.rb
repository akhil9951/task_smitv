class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         #:jwt_authenticatable, jwt_revocation_strategy: self

has_many :products
has_many :orders

ROLES = %w{admin coustomer}


def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.full_name = auth.info.name
    user.avatar_url = auth.info.image

  end
end


def jwt_payload
  super
end

# ROLES.each do |role_name|
#   define_method "#{role_name}" do
#     role == role_name
#   end
#   end

def admin?
  role == 'admin'
end

def coustomer?
  role == 'coustomer'
end

end
