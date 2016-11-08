# set path to application
app_dir = "/home/ubuntu/project"
shared_dir = "/home/ubuntu"
working_directory app_dir


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "/tmp/unicorn.sock", :backlog => 64
# Logging
stderr_path "#{shared_dir}/unicorn.stderr.log"
stdout_path "#{shared_dir}/unicorn.stdout.log"

# Set master PID location
pid "#{shared_dir}/unicorn.pid"