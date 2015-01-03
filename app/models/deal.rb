class Deal < ActiveRecord::Base

  belongs_to :category, :counter_cache => true

  # validations
  validates_presence_of   :title, :deal_url
  validates_uniqueness_of :slug    # uniq also at database level

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :photo_url, ImageUploader
end
