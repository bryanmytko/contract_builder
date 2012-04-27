class HourlyController < ApplicationController
	#updates hourly rate, not RESTful. Fix this one day. Move.
	def update
		@contract = Contract.find(params[:id])
		@build = Build.find_by_contract_id(@contract.id)
		@build.update_attributes(params[:build])
	end
	
end
