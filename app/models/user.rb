class User < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :projects , :through => :works
	has_many :projects_owned, :foreign_key => 'owner_id', :class_name => 'Project'
	validates :fname, presence: true

	def to_s
		"#{lname}  #{fname}"
	end

end
