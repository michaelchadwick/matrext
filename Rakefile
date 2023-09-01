require 'bundler/gem_tasks'

task :deploy do |t|
  file = Dir.glob("pkg/*").max_by {|f| File.mtime(f)}

  sh "git push origin master"
  sh "rake build"
  sh "gem push #{file}"
end

task :default => :deploy
