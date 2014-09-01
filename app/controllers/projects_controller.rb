class ProjectsController < ApplicationController
	def new
		@project= Project.new
	end

	def create
		@project = current_user.projects.create(project_params)				
  	redirect_to project_path(@project)
	end

	def show
	end

	private
	def project_params
		params.require(:project).permit(:proj_name, :client_name, :co_ordinator, :about_project_work, :started_date)
	end
end
