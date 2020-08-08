class Service < ApplicationRecord
  belongs_to :car
  has_many :parts
  # has_many :receipts

  has_many_attached :uploads
  # validate :upload_size
end
=begin
private 

  def upload_size
    if uploads.attached?
      if uploads.blobs.byte_size > 5242880
        errors[:base] << 'Too Big'
      end
    end
  end
=end

