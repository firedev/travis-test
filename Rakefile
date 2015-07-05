require 'bundler/setup'

task default: :list

desc 'Lists all the tasks'
task :list do
  puts 'Tasks:'
  puts Rake::Task.tasks.join("\n- ")
end

desc 'Check for dependencies'
task :check do
  environment_vars = [
    'OPSCODE_USER',
    'OPSCODE_ORGNAME',
    'KNIFE_CLIENT_KEY_FOLDER',
    'KNIFE_VALIDATION_KEY_FOLDER',
    'KNIFE_CHEF_SERVER',
    'KNIFE_COOKBOOK_COPYRIGHT',
    'KNIFE_COOKBOOK_LICENSE',
    'KNIFE_COOKBOOK_EMAIL',
    'KNIFE_CACHE_PATH'
  ]
  errors = []
  environment_vars.each do |var|
    if ENV[var].nil?
      errors.push(" - \e\[31m#Variable: {var} not set!\e\[0m\n")
    else
      puts " - \e\[32mVariable: #{var} set to \"#{ENV[var]}\"\e\[0m\n"
    end
  end
end

desc 'Build package'
task :build do
  Rake::Task[:chefspec].execute
end

desc 'Fire up Vagrant'
task :start do
  sh "vagrant up"
end

desc 'Runs specs'
task :chefspec do
  sh "bundle exec rspec cookbooks"
end

desc 'Food critic'
task :foodcritic do
  sh "foodcritic -I test/foodcritic/* -f any cookbooks"
end
