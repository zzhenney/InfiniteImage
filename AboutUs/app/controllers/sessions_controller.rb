class SessionsController < Clearance::SessionsController
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        puts status
        #redirect_back_or url_after_create
        url_after_create
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

  def destroy
    sign_out
    #redirect_to url_after_destroy
    #create url_for_guest_users - this view will have the register/login options
    url_for_signed_in_users
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to home_index_path
    end
  end

  def url_after_create
    #Clearance.configuration.redirect_url
    redirect_to home_index_path
  end
end