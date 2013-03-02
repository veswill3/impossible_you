class Goal < ActiveRecord::Base
  belongs_to :list
  attr_accessible :completed, :description, :img_url, :title
end
