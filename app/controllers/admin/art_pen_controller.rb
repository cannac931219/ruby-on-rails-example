class Admin::ArtPenController < AdminController
	def index
		@ArtPen = ArtPen.all
	end

	def create
		name = params[:name]
		if !name.nil?
			ArtPen.create!({
				:name => name
			})
			redirect_to "/admin/art_pen"
		end
		puts '--------'
		puts "#{name}"
		puts '--------'
	end

	def show
		@ArtPenOne = ArtPen.find(params[:id])
	end

end
