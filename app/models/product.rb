class Product < ApplicationRecord
has_many :orders, through: :users
has_one_attached :image #we use has_many too
scope :min_price,-> {where('price >?', '0').order('price asc')}
scope :max_price,-> {where('price >? ','0').order('price DESC')}


scope :time, -> { where('created_at > ?', 1.day.ago).order("created_at DESC") }
end
