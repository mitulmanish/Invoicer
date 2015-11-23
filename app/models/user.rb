class User < ActiveRecord::Base
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :company
	has_many :works
	has_many :projects , :through => :works
	has_many :projects_owned, :foreign_key => 'owner_id', :class_name => 'Project'
	#validates :fname, presence: true

	def to_s
		"#{lname}  #{fname}"
	end

end
