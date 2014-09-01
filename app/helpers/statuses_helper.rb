module StatusesHelper	
	def get_intime(intime)
		return intime.in_time.strftime("%r")				
	end
	def get_outtime(outtime)		
  	return outtime.out_time.strftime("%r")		
	end
	def get_tworkhour(tworkhour)
  	return Time.at(tworkhour.work_hour).gmtime.strftime('%R:%S')				
	end	
	def get_breaktime(brktime)	
		return Time.at(brktime.break_time).gmtime.strftime('%R:%S')				
	end
end
