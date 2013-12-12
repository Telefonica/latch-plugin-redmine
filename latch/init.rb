require 'redmine'

Redmine::Plugin.register :latch do
  name 'Latch plugin'
  author 'Eleven Paths'
  description 'This is a plugin to integrate Latch service with Redmine'
  version '0.0.1'
  url 'http://www.elevenpaths.com'
  author_url 'http://www.elevenpaths.com'

  settings :default => {:latch_appid => '''', :latch_secret => ""}, :partial => 'latch/settings'

  menu :account_menu, :latch,  {:controller => 'latch_accounts', :action => 'index'}, :caption => 'Latch',
      :if => Proc.new { User.current.logged? &&
                                Setting.plugin_latch['latch_appid'] != "" &&
                                Setting.plugin_latch['latch_secret'] != ""}



  require_relative 'lib/login_hook'
end
