require "bundler/gem_tasks"

require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
end

task :default => :test

desc 'モバゲーからデータを取ってくる'
task :scrape do
  load('script/scrape.rb')
end

desc 'idols.rb を作る'
task :generate do
  load('script/generate.rb')
end
