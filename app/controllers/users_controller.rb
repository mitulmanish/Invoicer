class UsersController < ApplicationController
	
	def index 
		@users = User.all
	end
	def show 
		@my_user = User.find(params[:id])
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
		redirect_to users_path
	end

	def destroy
		@user = User.find(params[:id])
 		@user.destroy
    	redirect_to users_path
	end
	
end
