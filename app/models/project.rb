class Project < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :users, :through => :works
	validates :company_id, presence: true
	validates :default_rate, presence: true
	validates :default_rate, numericality: { only_integer: true,
									  greater_than: 0,
									  less_than_or_equal_to: 100}

	def to_s
		"#{name}"
	end
end
