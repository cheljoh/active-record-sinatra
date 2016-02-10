
class Genre < ActiveRecord::Base
  has_many :films #needs to be plural!
  validates :name, presence: true
  # validates_presence_of :name #good for validating numerous attr
end
