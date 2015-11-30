class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [:show, :edit, :update]
  def index
  	@projects = Project.all
    respond_to do |format|
      format.html
      format.xml  { render xml: @projects}
      format.json { render json: @projects}
      format.csv { send_data Project.export_csv(@projects), type: 'text/csv; charset=utf-8; header=present', disposition: 'attachment; filename=contacts.csv' }
    end
  end

  def show
  	if params[:slug]
  	@project = Project.find_by slug: params[:slug]
  	else
    @works = @project.works
    end
    respond_to do |format|
      format.html
      format.xml  { render xml: @project}
      format.json { render json: @project.owner}
    end
  end
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project Created'
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end


  private
  def project_params
    params[:project].permit(:name, :slug, :company_id, :default_rate, :owner_id)
  end
  def find_project
    @project = Project.find(params[:id])
  end


end
