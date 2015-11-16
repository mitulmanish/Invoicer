class User < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :projects , :through => :works
	validates :fname, presence: true

	def to_s
		"#{lname}  #{fname}"
	end

end
