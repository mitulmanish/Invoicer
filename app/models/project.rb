class Project < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :users, :through => :works

	def to_s
		"#{name}"
	end
end
