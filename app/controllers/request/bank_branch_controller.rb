class Request::BankBranchController < RequestController
	def create 
		user = params[:user_id]
		bank = params[:bank_id]
		branchName = params[:branch_name]
		branchNo = params[:branch_no]
		if user.blank? == false && bank.blank? == false && branchName.blank? == false && branchNo.blank? == false
			BankBranch.create!({
				:bank_id => bank,
				:branch_name => branchName,
				:branch_no => branchNo
			})
			redirect_to '/request/bank_branch'
		else
			redirect_to '/request/error', :notice => 'has nil,need all write!'
		end
	end
	
	def index
		@user = User.all
		@bank = Bank.all.order( created_at: :desc )
		@branch = BankBranch.joins(:bank).select('bank_branches.id, bank_branches.branch_name, bank_branches.branch_no, banks.bank_name as bank_name')
		# filter
		if params[:user_id] != '0'
			if Bank.where('user_id = ?', params[:user_id]).length != 0
				@bankAll = Bank.where('user_id = ?', params[:user_id]).order( created_at: :desc )
				@user_name = User.where('id = ?', params[:user_id]).first[:user_name]
			end
		elsif params[:user_id] == '0'
			if Bank.all.length != 0
				@bankAll = Bank.all.order( created_at: :desc )
				@user_name = "全部"
			end
		end
	end
end
