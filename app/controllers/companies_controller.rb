class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end

	def show
		@company = Company.find(params[:id])
		@projects = @company.projects
		@users = @company.users
		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render xml: @company}
			format.json { render json: @company}
		end
	end
end
