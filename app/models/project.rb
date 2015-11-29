class Project < ActiveRecord::Base
	belongs_to :company
	has_many :works
	has_many :users, :through => :works
	belongs_to :owner, class_name: 'User'
	validates :name, length: { minimum: 5 }
	validates :company_id, presence: true
	validates :owner_id, presence: true
	validates :default_rate, numericality: { only_integer: true,
																					 greater_than: 30,
																					 less_than: 100 }
	validates :slug, length: { minimum: 3 }
	validates :slug, uniqueness: true

	def to_s
		"#{name}"
	end

	def self.export_csv(projects)
		CSV.generate() do |csv|
			csv << ['created_at','name','owner','default_rate','most recent work']
			projects.each do |project|
				csv << [ project.created_at,
								 project.name,
								 project.owner,
								 project.default_rate,
								 project.works.order("created_at DESC").first
				]
			end
		end
	end
end
