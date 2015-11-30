class CompaniesController < ApplicationController
	before_action :find_company, only: [:show, :edit, :update]
	def index
		@companies = Company.all
	end

	def show
		@projects = @company.projects
		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render xml: @company}
			format.json { render json: @company}
		end
	end
	def new 
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			flash[:notice] = 'Company Created'
			redirect_to companies_path
		else
			render 'new'
		end
	end

	def update
		if @company.update(company_params)
			flash[:notice] = 'Company Updated'
			redirect_to @company
		else
			render 'edit'
		end
	end

	def edit
	end

	private
	def find_company
		@company = Company.find(params[:id])
	end
	def company_params
		params[:company].permit(:name)
	end
end
