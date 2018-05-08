class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create

    if resource = User.find_for_database_authentication(email: params[:user][:email])
      return unauthorized_reset_password_attempt unless resource.is_admin?
    end

    super
    Log.recover_password(resource)
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /resource/password
  def update
    #super

    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message) if resource.is_admin?
        sign_in(resource_name, resource) if resource.is_admin?
      else
        set_flash_message!(:notice, :updated_not_active)
      end
      Log.updated_password(resource)
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def after_resetting_password_path_for(resource)
    # super(resource)
    return after_sign_in_for_mobile_path unless resource.is_admin?
    Devise.sign_in_after_reset_password ? after_sign_in_path_for(resource) : new_session_path(resource_name)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end

  def unauthorized_reset_password_attempt
    warden.custom_failure!

    flash[:alert] = "Usuário não cadastrado no sistema."
    redirect_to new_user_password_path
  end
end
