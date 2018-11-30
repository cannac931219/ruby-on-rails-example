namespace :test do
	desc 'test somethings of here'
	task :tell_you do
		puts 'tell_you sth'
	end
	task :listen => [:environment] do 
		art = Weather.all
		puts "#{art.first['id']}"
	end
	task :a do
		c = [{id: 111}]
		puts "#{c.first[:id]}" 
	end
end