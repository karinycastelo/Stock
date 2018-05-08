class Users::SessionsController < Devise::SessionsController
before_action :configure_permitted_parameters, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create

    if resource = User.find_for_database_authentication(email: params[:user][:email])
      return unauthorized_login_attempt unless true#resource.is_admin? #role == Role.find_by_name("ADMIN")
    end

    super
    # Log.login(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    super
    # Log.logout(resource)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  # end

  private

  def unauthorized_login_attempt
    warden.custom_failure!

    flash[:alert] = "Usuário não autorizado."
    redirect_to new_user_session_path
  end
end
