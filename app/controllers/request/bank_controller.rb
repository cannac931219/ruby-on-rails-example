class Request::BankController < RequestController
	def create 
		# p '----------------'
		# p params[:user_id]
		# p params[:bank_no]
		# p params[:bank_name]
		# p params[:user_id].blank? 
		# p params[:bank_no].blank? 
		# p params[:bank_name].blank? 
		# p '----------------'
		if params[:user_id].blank? == false && params[:bank_no].blank? == false && params[:bank_name].blank? == false
			Bank.create!({
				:user_id => params[:user_id],
				:bank_no => params[:bank_no],
				:bank_name => params[:bank_name]
			})
			redirect_to '/request/bank'
		else 
			redirect_to '/request/error', :notice => 'has nil,need all write!'
		end	
	end
	
	def index
		@user = User.all
		# filter
		# @bankAll = Bank.all.order( created_at: :desc )
		@bankAll = Bank.all.joins(:user).select('banks.id, banks.bank_name, banks.bank_no, users.user_name as user_name').order(created_at: :desc)
		@user_name = "全部"
		if params[:user_id] != '0'
			if Bank.where('user_id = ?', params[:user_id]).length != 0
				# @bankAll = Bank.where('user_id = ?', params[:user_id]).order( created_at: :desc )
				@user_name = User.where('id = ?', params[:user_id]).first[:user_name]
				@bankAll = Bank.where('user_id = ?', params[:user_id]).joins(:user).select('banks.id, banks.bank_no, banks.bank_name, users.user_name as user_name')
			end
		elsif params[:user_id] == '0'
			if Bank.all.length != 0
				# @bankAll = Bank.all.order( created_at: :desc )
				@bankAll = Bank.all.joins(:user).select('banks.id, banks.bank_name, banks.bank_no,users.user_name as user_name')
				@user_name = "全部"
			end
		end

	end


	private
end
