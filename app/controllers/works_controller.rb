class WorksController < ApplicationController
	def index
		@works = Work.all
	end

	def show
		@work = Work.find(params[:id])
		@user = User.find_by_id(@work.user_id)
		@project = Project.find_by_id(@work.project_id)
	end

	def new
    	@work = Work.new()
	end

	def create	
		@work = Work.find(params[:id])
	end
end
