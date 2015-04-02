# script/redis.rake
	namespace :redis do
	    desc "TODO"
	    task :start => :environment do
	        command = %q(redis-server /etc/redis.conf)
	        systemu command
	        p command
	    end

	    task :stop => :environment do
	        pid = 0
	        File::open("/var/run/redis.pid") {|f|
	            pid = f.gets
	        }

	        command = "kill " + pid
	        systemu command

	        p command
	    end
	end