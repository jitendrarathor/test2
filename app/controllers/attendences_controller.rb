class AttendencesController < ApplicationController

	before_action :authenticate_user!

	def checkin
		#@attendence=Attendence.new
		@attendence=Attendence.new(:in_time =>Time.now, :in_date =>Date.today,:user_id =>current_user.id, :ip_in =>request.remote_ip, :workhour => '0')
		if @attendence.save
		  redirect_to attendences_path
		else
			render 'index'
		end
	end

	def checkout
		@attendence = current_user.attendences.last

		if @attendence.in_date == Date.today
	  	@attendence.update(:out_time =>Time.now, :out_date =>Date.today, :ip_out =>request.remote_ip,:status=>'false', :workhour => (Time.now.seconds_since_midnight - @attendence.in_time.seconds_since_midnight).round)
  	else
  		updated_time = Time.new(@attendence.in_date.year, @attendence.in_date.month, @attendence.in_date.day, 23,59,59)
			@attendence.update(:out_time => updated_time, :out_date =>@attendence.in_date, :ip_out =>request.remote_ip,:status=>'true', :workhour => (updated_time.seconds_since_midnight - @attendence.in_time.seconds_since_midnight).round)
		end
		redirect_to attendences_path
	end

	def update
		Attendence.create([:attendence].require(:attendence).permit(:in_date, :in_time, :out_date, :out_time))
	end

 	private
	  def attendence_params
	    params.require(:attendence).permit(:in_date, :in_time, :out_date, :out_time, :ip_in, :ip_out,:user_id)
	  end
end
