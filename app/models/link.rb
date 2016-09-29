class Link < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  validates :title, :url,  presence: true
end
