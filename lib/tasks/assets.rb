namespace :assets do
  desc "Precompile the assets"
  task :precompile do
    require './portfolio'
    Portfolio.compile_assets
  end
end
