require 'colorize'
require 'git'
require 'fileutils'

puts 'Welcome to CWI development box'.yellow

# config git users
puts 'Lets start configuring your git user'

puts 'Please enter your git user name:'.light_blue
git_user_name = gets.chomp

puts 'Please enter your git user email:'.light_blue
git_user_email = gets.chomp

system("git config --global user.name \"#{git_user_name}\"")
system("git config --global user.email \"#{git_user_email}\"")

puts 'Generating ssh keys'
system 'mkdir ~/.ssh'
system 'ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa'

puts 'ssh key generated successfully'
puts 'add this key on https://github.com/settings/ssh (this step is needed for interacting with git repos):'
puts File.read('/home/vagrant/.ssh/id_rsa.pub').light_blue
puts 'press enter to continue...'
gets

puts 'cloning projects...'
# Change this array to clone specific projects
projects = [
  {git: 'git@github.com:rails/rails.git', project_name: 'rails'}
]

projects.each do |project|
  if File.directory?("/vagrant/projects/#{project[:project_name]}")
    puts "project #{project[:project_name]} already cloned"
  else
    puts "cloning #{project[:project_name]}"
    Git.clone(project[:git], "/vagrant/projects/#{project[:project_name]}")
  end

  system "ln -s /vagrant/projects/#{project[:project_name]} ~/#{project[:project_name]}"
end

# removes script form bashrc
system "sed -i '/.*first_time.rb/d' ~/.bashrc"

puts 'you are now ready to use the development box!'
puts 'press enter to continue...'
gets

Dir.chdir '/home/vagrant'
system 'clear'
system 'ls'


