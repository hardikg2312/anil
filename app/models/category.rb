class Category < ActiveRecord::Base

  has_many :deals

  # validations
	validates_presence_of   :name
	validates_uniqueness_of :slug    # uniq also at database level

	extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :photo_url, ImageUploader
end
