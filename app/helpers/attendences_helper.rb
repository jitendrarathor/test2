module AttendencesHelper	
	def get_checkout(attendence1)			
		Time.at((attendence1.workhour).to_i).gmtime.strftime('%R:%S')				
	end	
	def get_intime(intimem)			
		intime.in_time.strftime("%r")					
	end
	def get_outtime(outtime)		
		outtime.out_time.strftime("%r")				
	end		
	def get_totalworkhour(tworkhour)			
		Time.at((tworkhour.workhour).to_i).gmtime.strftime('%R:%S')			
	end	
end
