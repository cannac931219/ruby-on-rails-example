class Request::UserController < RequestController
	def index
		@user = User.all
	end
	def show
		@user = User.all
	end

end
