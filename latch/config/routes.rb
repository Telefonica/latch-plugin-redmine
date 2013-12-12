# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'latch', :to => 'latch_accounts#index'
post 'latch/pair', :to => 'latch_accounts#pair'
post 'latch/unpair', :to => 'latch_accounts#unpair'
