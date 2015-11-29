class User::RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_parameters
  def index
		@users = User.all
  end

	def create
    @user = User.new(user_params)
	    if @user.save
				ExampleMailer.sample_email(@user).deliver
	      redirect_to users_path
	    else
	      render 'new'
	    end
  	end

	def show 
		@my_user = User.find(params[:id])
		@my_projects  = @my_user.projects
		@my_company = @my_user.company

	end

	def new
		@user = User.new
	end
	def edit 
		@user = User.find(params[:id])
	end

	def my_method
		# invetigate why user_id works in the params hash and not id
		@my_user = User.find(params[:user_id])
		redirect_to @my_user
	end

	def destroy
		@user = User.find(params[:id])
 		@user.destroy
    	redirect_to users_path
  end

  private
  def user_params
    params[:user].permit(:fname, :lname, :company_id, :email)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:fname, :lname)
  end

end
