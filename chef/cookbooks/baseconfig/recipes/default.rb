# Make sure the Apt package lists are up to date, so we're downloading versions that exist.
cookbook_file "apt-sources.list" do
  path "/etc/apt/sources.list"
end
execute 'apt_update' do
  command 'apt-get update'
end

# Base configuration recipe in Chef.
package "wget"
package "ntp"
cookbook_file "ntp.conf" do
  path "/etc/ntp.conf"
end
execute 'ntp_restart' do
  command 'service ntp restart'
end

# db web server set up
package "nginx"
package "git"
package "postgresql"


# cookbook_file "default" do
#   path "/etc/nginx/sites-available/default"
# end

# execute 'nginx_restart' do
#   command 'service nginx restart'
# end

# execute 'postgres_user db setup' do
# 	command 'echo "CREATE DATABASE mydb; CREATE USER ubuntu; GRANT ALL PRIVILEGES ON DATABASE mydb TO ubuntu;" | sudo -u postgres psql'
# end

# Rails setup
package "ruby-dev"
package "sqlite3"
package "libsqlite3-dev"
package "libpq-dev"
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
	command 'rails db:migrate'
end

execute 'run server' do
	user 'ubuntu'
	cwd '/home/ubuntu/project'
	command 'rails server -d -b 0.0.0.0'
end