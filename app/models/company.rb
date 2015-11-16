class Company < ActiveRecord::Base
	has_many :users
	has_many :projects
	validates :name ,presence: true

	def to_s
		"#{name}"
	end

end
