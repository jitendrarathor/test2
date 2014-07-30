module AttendencesHelper

	def checkin
	end

	def checkout
		@attendence.update(:workhour =>((Time.now.seconds_since_midnight - @attendence.in_time.seconds_since_midnight).round))
	end
	
end
