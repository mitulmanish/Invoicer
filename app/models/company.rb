class Company < ActiveRecord::Base
	has_many :projects, :foreign_key => 'company_id'
	validates :name ,presence: true

	def to_s
		"#{name}"
	end

end
