class Work < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	validates :project_id, presence: true
	validates :user_id, presence: true
	validates :datetimeperformed, presence: true
	validate :date_is_in_past
	validates :hours, numericality: { only_integer: true,
									  greater_than: 0,
									  less_than_or_equal_to: 8 }
	scope :fullday, -> { where("hours >= 8") }
	#scope :recent, -> { where("datetimeperformed > '#{Time.now - 7.days}'")}

	def self.recentdays(numdaysago)
		since_date = Time.now - numdaysago.to_i.days
		where("datetimeperformed > '#{since_date}'")
	end

	def date_is_in_past
		if datetimeperformed.present? && datetimeperformed > Time.now
			errors.add(:datetimeperformed, "can't be in the future")
		end
	end

	def formatted_date
		#date_format
		datetimeperformed.to_formatted_s(:long_ordinal)
	end

	def date_format
		datetimeperformed.strftime("%d/%m/%Y %I:%M %p")
	end

	def to_s
	    "#{hours} by #{user} on #{datetimeperformed}"
	end
	

	def employee
		"#{user}"
	end

	def on_project
		"#{project}"
	end

	def datenTime
		"#{formatted_date}" 
	end

	def hours_worked
		"#{hours} hours"
	end

	
end
