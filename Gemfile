source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'danger'
gem 'danger-checkstyle_format'
gem 'rubocop', '0.57.2', require: false
gem 'rubocop-checkstyle_formatter'
