require 'rubygems'
require 'vagrant'

desc 'Install modules using librarian-puppet'
task :install_modules do
  sh 'bundle exec librarian-puppet install' do |ok, res|
    unless ok
      fail('failed to install puppet modules')
    end
  end
end

desc 'Update modules using librarian-puppet'
task :update_modules => :install_modules do
  sh 'bundle exec librarian-puppet update' do |ok, res|
    unless ok
      fail('failed to update puppet modules')
    end
  end
end

desc 'Installs and updates puppet modules, then runs vagrant up'
task :launch_box => :update_modules do
  env = Vagrant::Environment.new(:ui_class => Vagrant::UI::Colored)
  env.cli("up")
end
