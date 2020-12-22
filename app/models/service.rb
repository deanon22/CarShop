class Service < ApplicationRecord
  belongs_to :car
  has_many :parts

  has_many_attached :uploads
 
  paginates_per 5
end

