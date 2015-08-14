der
#!/usr/bin/env ruby

# require gem libraries
require 'rubygems'
require 'fileutils'

# get the current directory
dir = File.expand_path(File.dirname(__FILE__))

# make new directory paths
special_dir = File.join(dir, 'special')

# make a directory
FileUtils.mkdir_p special_dir

# copy files to a directory
FileUtils.cp one.rb, special_dir
FileUtils.cp %w(one.rb two.rb three.rb), special_dir
FileUtils.cp_r 'lib/', special_dir
# overwrite a file
FileUtils.cp one.rb, special_dir, :force => true 
# output the command called
FileUtils.cp one.rb, special_dir, :verbose => true

# move files to a directory
FileUtils.mv 'one.rb', special_dir

# remove a file
FileUtils.rm %w(one.rb two.rb three.rb)
FileUtils.rm one.rb
FileUtils.rm_f one.rb
FileUtils.rm_rf 'lib'

# check if file 
File.file?(filename)
File.directory?(filename)

# check if a file or directory exists
File.exists?(special_dir)

# change directory
Dir.chdir checkout_dir 
Dir.chdir('glassfish') do
  system "do something" 
end

# get file name from a path
File.basename("/Users/bob/project/start.sh") # start.sh"

# read a file contents line by line
File.open("file.sql", "r") do |file|
  file.each_line do |line|
    puts line
  end
end

IO.foreach(filename) do |line| 
  puts line
end

# write to a file
File.open("delete.sql", "w") do |file|
  file.write(sql)
end

# create a unique filename using a date. year month day hour minute second
DateTime.now.strftime("%Y%m%d%H%M%S")

# run a terminal command 
system 'pwd'

# run a bunch of terminal commnands
system <<-END
  mkdir -p /tmp/
  sleep 1
  touch tmp/restart.txt
END

# run a terminal commnad over ssh
system("ssh username@hostname 'ls -lh'")

# in bash create a public key and store it on the server so your script doesn't have to deal with the password
# ssh-keygen -t rsa
# cat ~/.ssh/id_rsa.pub | ssh -p22 user@hostname "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && cat - >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && chmod 700 ~/.ssh"

# store common code in methods
def ssh_run(cmd)
  system("ssh username@hostname '#{cmd}'")	
end
ssh_run("rm file.sql")

# run logic on a command output
unless `git status`.include?('nothing to commit'); end
if `git status` =~ /a/; end

# loops around a list of files
Dir::glob('*.avi').each do |filename| puts filename; end
# recursively scan the directories
Dir::glob('/Users/bob/downloads/**/*').each do |filename| puts filename; end

# load a yaml config file
require 'yaml'
config = YAML.load_file('config.yml')
# hash imported { '2004465' => '/ruby/rvm.sh', '2004974' => '/ruby/scripts.rb' }
gist_id_to_filename = config['gists']

# config.yml
gists:
  '2004465': /ruby/rvm.sh
  '2004974': /ruby/scripts.rb

# easy method for creating yaml in irb
puts ({'gists' => {'2004465' => '/ruby/rvm.sh', '2004974' => '/ruby/scripts.rb'}}).to_yaml
