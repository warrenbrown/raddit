class Link < ActiveRecord::Base
  validates :title, :url,  presence: true
end
