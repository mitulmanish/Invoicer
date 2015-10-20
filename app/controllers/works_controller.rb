class WorksController < ApplicationController
	def index
		@works = Work.all
	end

	def show
		@work = Work.find(params[:id])
		@project = @work.project
		@user = @work.user
	end
end
