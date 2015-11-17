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
		@work = Work.new(work_params)
		if @work.save
			redirect_to @work
		else
			render 'new'
		end
	end

	def edit
		@work = Work.find(params[:id])
	end

	def update
		@work = Work.find(params[:id])

		if @work.update(work_params)
			flash[:notice] = 'Work Updated'
			redirect_to @work
		else
			render 'edit'
		end
	end

	private
	def work_params
		params[:work].permit(:project_id, :datetimeperformed, :hours)
	end
end
