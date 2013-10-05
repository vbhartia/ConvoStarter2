class ConnectController < ApplicationController
	def home
	end

	def start_connect
		puts params[:coords][:latitude]

		#Record Connection
		connection = Connection.create()
    	connection.user = current_user
    	connection.lat = params[:coords][:latitude]
    	connection.long = params[:coords][:longitude]
    	connection.save

		#Find Matches	
    	time_range = (Time.now - 5.seconds)..Time.now
		possible_connections = Connection.where('created_at' => time_range)
		possible_connections = possible_connections.delete_if{|x| x.id == connection.id}	

    	possible_connections.each do |indv_connection|
    		puts indv_connection.created_at
    	end 

    	puts possible_connections.count

    	#Check location


    	#Connection Made
		#@connected_user = possible_connections.first.user

		if (possible_connections.count > 0)
		    
		    #sleep(5)



		    respond_to do |format|
    		    format.json { render :json => user_pages_url }
    		end

		else
			respond_to do |format|
    		    format.json { render :json => static_none_found_url }
    		end
		end
	end
end

private
	def check_connection ()

	end
end
