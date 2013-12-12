require_relative "../app/controllers/latch_accountscontroller"

class LoginHook < Redmine::Hook::ViewListener

      def controller_account_success_authentication_after(context = { })

        @latch = LatchAccount.where(user_id: User.current.id).first
        account_id = @latch.account_id

        appid = Setting.plugin_latch['latch_appid']
        secret = Setting.plugin_latch['latch_secret']

        if (!appid.empty? && !secret.empty? && account_id != nil && account_id != "")


          api = Latch.new(appid, secret)

          pairResponse = api.status(account_id)
          if (pairResponse != nil && pairResponse.error == nil && pairResponse.data != nil)
                status = pairResponse.data['operations'][appid]['status']
                if (status != nil && status == 'off')
                  #context[:controller].logout_user
                  #context[:controller].params[:password] = ""
                  #context[:controller].flash.now[:error] = l(:notice_account_invalid_creditentials)
                  context[:controller].logout_user
                  context[:controller].params[:back_url] = ""
                  context[:controller].back_url
                  return
                end
          end

        end
        #context[:controller].redirect_back_or_default my_page_path
      end
end
