class Product < ApplicationRecord
has_many :orders, through: :users
has_one_attached :image #we use has_many too

end
