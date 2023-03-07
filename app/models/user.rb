class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

has_many :products
has_many :orders

ROLES = %w{admin coustomer}


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
