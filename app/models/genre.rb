
class Genre < ActiveRecord::Base
  has_many :films #needs to be plural!
end
