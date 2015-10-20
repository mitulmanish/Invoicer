class Work < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	scope :fullday, -> { where("hours >= 8") }
end
