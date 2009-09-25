namespace :wee_beastie do

  desc "syncs migrations"
  task :sync_migrations do
    system "rsync -ruv vendor/plugins/wee_beastie/db/migrate db"
  end
  
  desc "sync public dir"
  task :sync_public do
    system "rsync -ruv vendor/plugins/wee_beastie/public/ public"
  end
  
  desc "install plugins"
  task :install_plugins do
    system "rsync -ruv vendor/plugins/wee_beastie/vendor/plugins/ vendor/plugins"
  end
  
  desc "install task"
  task :install do
    sync_migrations
    sync_public
    install_plugins
  end

end
