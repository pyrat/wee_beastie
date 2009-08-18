namespace :wee_beastie do

desc "syncs migrations"
task :sync do
  system "rsync -ruv vendor/plugins/wee_beastie/db/migrate db"
end

end