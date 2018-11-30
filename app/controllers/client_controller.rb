class ClientController < ApplicationController
	layout 'admin'

	def index
		client_id = 1
		client = Client.find(client_id)
		@clientImage = client.docs
	end

	def show
	end

	def create
		
	end

end
