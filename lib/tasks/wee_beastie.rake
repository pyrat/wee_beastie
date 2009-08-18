namespace :wee_beastie

desc "syncs migrations"
task :sync_migrations do
  system "rsync -ruv vendor/plugins/wee_beastie/db/migrate db"
end

end