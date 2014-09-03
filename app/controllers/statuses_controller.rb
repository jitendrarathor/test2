class StatusesController < ApplicationController
	#include StatusesHelper
	def new
		@status= Status.new
	end

	def create	
		params[:status][:work_hour] = params[:status][:hour1].to_i * 60 * 60 + params[:status][:mins1].to_i * 60
		params[:status][:break_time] = params[:status][:hour].to_i * 60 * 60 + params[:status][:mins].to_i * 60
		
		@status = current_user.statuses.new(status_params)				
  	@status.save
  	redirect_to status_path('show')
  	#render 'show' 				
	end

	def show
	end

	private
	def status_params
		params.require(:status).permit(:subject, :date, :in_time, :out_time, :project_name, :client_name, :co_ordinator, :work_hour, :break_time, :meeting_description, :total_task, :task_description, :status_msg, :resion)
	end
end
