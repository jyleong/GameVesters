# # Make sure the Apt package lists are up to date, so we're downloading versions that exist.
cookbook_file "apt-sources.list" do
  path "/etc/apt/sources.list"
end
execute 'apt_update' do
  command 'apt-get update'
end

# # Base configuration recipe in Chef.
package "wget"
package "ntp"
cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end
execute 'ntp_restart' do
  command 'service ntp restart'
end

package "nginx"
package "git"
package "libpq-dev"
package "postgresql"

cookbook_file "nginx-default" do
	path "/etc/nginx/sites-available/default"
end
execute 'nginx_restart' do
	command 'service nginx restart'
end

execute 'setup_db' do
	command 'echo "CREATE DATABASE mydb; CREATE USER ubuntu; GRANT ALL PRIVILEGES ON DATABASE mydb TO ubuntu;" | sudo -u postgres psql'
end

execute 'nginx_reload' do
	command 'service nginx reload'
end

# # Rails setup

package "ruby-dev"
package "sqlite3"
package "libsqlite3-dev"
package "zlib1g-dev"
package "nodejs"
package "build-essential"

execute 'bundler install' do
	command 'gem install bundler --conservative'
end

execute 'bundler' do
	user 'ubuntu'
	cwd '/home/ubuntu/project'
	command 'bundle install'
end

execute 'migrate' do
	user 'ubuntu'
	cwd '/home/ubuntu/project'
	command 'rails db:migrate RAILS_ENV=production'
end

cookbook_file "unicorn_rails" do
  path "/etc/init.d/unicorn_rails"
end

execute 'enable unicorn' do
	user 'ubuntu'
	cwd '/home/ubuntu/project'
	command "update-rc.d unicorn_rails defaults"
end

execute 'run unicorn production ' do
	user 'ubuntu'
	cwd '/home/ubuntu/project'
	command "bundle exec unicorn -c config/unicorn.rb -E production -D"
end


# execute 'run server' do
# 	user 'ubuntu'
# 	cwd '/home/ubuntu/project'
# 	command 'rails server -d -b 0.0.0.0'
# end