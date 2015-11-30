class WorksController < ApplicationController
	before_action :authenticate_user!
	before_action :find_work_item, only: [:show, :edit, :update]
	def index
		@works = Work.order('updated_at DESC')

    frequencies = Hash.new(0)
    @works.each { |work| frequencies[work.hours] += 1 }
    frequencies.keys.sort!
    respond_to do |format|
      format.html
      format.xml  { render xml: @works}
      format.json { render json: frequencies}
    end
	end

	def show

		@user = User.find_by_id(@work.user_id)
		@project = Project.find_by_id(@work.project_id)
    respond_to do |format|
      format.html
      format.xml  { render xml: @work}
      format.json { render json: @work}
    end
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
			ExampleMailer.workcreated_email(@work).deliver
			redirect_to works_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update

		if @work.update(work_params)
      if params[:doc]
        uploaded_io = params[:doc]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
          @work.doc = uploaded_io.original_filename
          ExampleMailer.workupdated_email(@work).deliver
        end
      end
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
  def find_work_item
    @work = Work.find(params[:id])
  end
end
