class ConnectController < ApplicationController
	def home
	end

	def start_connect
    	Connection.uncached do 
			puts params[:coords][:latitude]

			#Record Connection
			connection = Connection.create()
	    	connection.user = current_user
	    	connection.lat = params[:coords][:latitude]
	    	connection.long = params[:coords][:longitude]
	    	connection.save

	    	time_range = (Time.now - 10.seconds)..Time.now
			returned_possible_connections = Connection.where('created_at' => time_range)
			returned_possible_connections = returned_possible_connections.delete_if{|x| x.id == connection.id}	

	    	#Check location


	    	#Connection Made
			#@connected_user = possible_connections.first.user

			if (returned_possible_connections.count > 0)
			    respond_to do |format|
	    		    format.json { render :json => user_pages_url }
	    		end
			else
				sleep 5
		    	new_time_range = (Time.now - 10.seconds)..Time.now
				
	    	
				new_possible_connections = Connection.where('created_at' => new_time_range)
				new_possible_connections = new_possible_connections.delete_if{|x| x.id == connection.id}	

				if (new_possible_connections.count > 0)
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
	end

end

