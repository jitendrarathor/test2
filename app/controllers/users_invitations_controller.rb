class UsersInvitationsController < Devise::InvitationsController


	def edit
	  render :edit, :layout => false
	end

  def new
    @user = User.new
  end

  def create
	 @user = User.new(user_params)
	 @user.save
  end
  
	def update
    User.create(params[:user].require(:user).permit(:email,:first_name,:last_name))
		self.resource = resource_class.accept_invitation!(resource_params)
		 
		if resource.errors.empty?
			flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
			set_flash_message :notice, flash_message
			sign_in(resource_name, resource)
			 
			redirect_to edit_user_registration_path
	  else
			respond_with_navigational(resource){ render :edit, :layout => false }
    end
  end

	private
  def user_params    
	  params.require(:user).permit(:email, :first_name, :last_name)
	end
end