ActiveAdmin.register User  do
  #permit_params :email, :first_name, :last_name
    index do
      selectable_column
      id_column
      column :email
      actions defaults: true do |user|
        link_to "Attendence", attendence_admin_user_path(user)
      end
      actions defaults: false do |user|
        link_to "Status",status_admin_user_path(user)
      end
      actions defaults: false do |user|
        link_to "Projects",project_admin_user_path(user)
      end

    end


    filter :email
    
    # See permitted parameters documentation:
    # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # permit_params :list, :of, :attributes, :on, :model
    #
    # or
    #
    # permit_params do
    #  permitted = [:permitted, :attributes]
    #  permitted << :other if resource.something?
    #  permitted
    # end

  

  action_item do
    link_to 'Invite New User', new_invitation_admin_users_path
  end
   
  collection_action :new_invitation do
    @user = User.new
  end
   
  collection_action :send_invitation, :method => :post do
     @user = User.invite!(params.require(:user).permit(:email, :first_name, :last_name), current_admin_user)
    if @user.errors.empty?
      flash[:success] = "User has been successfully invited."
      redirect_to admin_users_path
     else
      messages = @user.errors.full_messages.map { |msg| msg }.join
      flash[:error] = "Error: " + messages
      redirect_to new_invitation_admin_users_path
    end
  end

  controller do
    def attendence
      @attendence = Attendence.where(:user_id => params[:id])   
      @attendences = @attendence.select("user_id, in_date, SUM(workhour) as workhour").group("in_date")   
      respond_to do |format|
        format.html
        format.csv { render attendence: @attendence.to_csv }
        format.xls #{render attendence: @attendence.to_csv(col_sep: "\t")}
      end
    end

    def attendences
      @attendence = Attendence.where(:user_id => params[:id])
      @attendences = @attendence.select("user_id, in_date, SUM(workhour) as workhour").group("in_date")   
      respond_to do |format|
        format.html
        format.csv { render attendences: @attendences.to_csv }
        format.xls #{render attendence: @attendence.to_csv(col_sep: "\t")}
      end
    end

    def status
      @status = Status.where(:user_id => params[:id])
    end 

    def project
      @projects = User.find(params[:id]).projects
      #@projects = User.where(id: params[:id]).first.try(:projects) 
    end   
  end
end
