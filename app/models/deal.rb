class Deal < ActiveRecord::Base

  belongs_to :category, :counter_cache => true
end
