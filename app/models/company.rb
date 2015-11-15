class Company < ActiveRecord::Base
	has_many :users
	has_many :projects

	def to_s
		"#{name}"
	end

end
