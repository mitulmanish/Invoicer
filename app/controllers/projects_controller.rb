class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end

  def show
  	if params[:slug]
  	@project = Project.find_by slug: params[:slug]
  	else
  	@project = Project.find(params[:id])
    @works = @project.works
  	end
  end
  def new
    @project = Project.new
  end

  def create
    @new_project = Project.new(project_params)
    if @new_project.save
      redirect_to @new_project
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  private
  def project_params
    params[:project].permit(:name, :slug, :company_id, :default_rate)
  end


end
