class StatusesController < ApplicationController

	def newstatus
		@status= Status.new
	end

	def create
		@status = current_user.statuses
		@status = @status.new(status_params)				
  	@status.save
  	render 'statusshow' 				
	end

	def statusshow
	end

	private
	def status_params
		params.require(:status).permit(:subject, :date, :in_time, :out_time, :project_name, :client_name, :co_ordinator, :work_hour, :break_time, :meeting_description, :total_task, :task_description, :status_msg, :resion)
	end
end
