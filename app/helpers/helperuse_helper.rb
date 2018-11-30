module HelperuseHelper
	def helperuser_print(a)
		prints = 0
		return prints + a
	end
	def self.helperuser_prints(a)
		return a.to_s + '定义的helper方法'		
	end
end
