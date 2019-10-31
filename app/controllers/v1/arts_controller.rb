class V1::ArtsController < ApplicationController
	def hello 
		title = params[:title]
		content = params[:content]

		Art.create(:title => title, :content => content)
		


		# render something is right
		render json: {
			:status => 200
										#data: {
											#:title => title,
											#:content => content,
											#:status => 200
										#}

		}


	end

	def index
	end	


end