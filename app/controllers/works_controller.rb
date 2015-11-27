class WorksController < ApplicationController
	before_action :authenticate_user!
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
    if params[:doc]
      uploaded_io = params[:doc]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        @work.doc = uploaded_io.original_filename
      end
    end
		if @work.save
			redirect_to works_path
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
		params[:work].permit(:project_id, :datetimeperformed, :hours, :user_id)
	end
end
