namespace :wee_beastie do

  desc "syncs migrations"
  task :sync_migrations do
    system "rsync -ruv vendor/plugins/wee_beastie/db/migrate db"
  end
  
  desc "sync public dir"
  task :sync_public do
    system "rsync -ruv vendor/plugins/wee_beastie/public/ public"
  end

end
