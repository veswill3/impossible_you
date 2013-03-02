class List < ActiveRecord::Base
  attr_accessible :description, :title
	has_many :goals
end
