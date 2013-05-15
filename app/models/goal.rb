class Goal < ActiveRecord::Base
  attr_accessible :completed, :description, :img_url, :title
  belongs_to :user

	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 140 }
	default_scope order: 'goals.created_at DESC'
end
