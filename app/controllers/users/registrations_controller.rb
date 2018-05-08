class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :one_user_registered?, only: [:new, :create]
  before_action :authenticate_user!
  before_action :authorize_admin?, only: [:new, :create, :edit, :update, :destroy]
  # prepend_before_action :require_no_authentication, only: []

  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]

  # def check_permissions
  #   authorize! :create, resource
  # end

  # protected
  #
  # def one_user_registered?
  #   if ((User.count < 2) & (user_signed_in?))
  #     redirect_to root_path
  #   elsif User.count < 2
  #     redirect_to new_user_session_path
  #   end
  # end

  # POST /resource
  # def create
  #
  #   if deleted = User.only_deleted.find_by_email(params[:user][:email])
  #
  #     # before = Log.to_string(deleted)
  #
  #     deleted.name = params[:user][:email]
  #     deleted.password = params[:user][:password]
  #     deleted.password_confirmation = params[:user][:password_confirmation]
  #
  #     deleted.restore
  #
  #     # Log.restored(deleted, current_user, before)
  #
  #   else
  #     super
  #     # Log.signed_up(resource, current_user)
  #   end
  #
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   # before = Log.to_string(resource)
  #   super
  #   # Log.updated_account(resource, before)
  # end

  # DELETE /resource
  # def destroy
  #
  #   if resource.is_last?
  #     flash[:alert] = "Não é possível excluir sua conta."
  #     redirect_to edit_user_registration_path
  #   else
  #     super
  #     # Log.signed_down(current_user)
  #   end
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def authorize_admin?
    if user_signed_in?
      true if current_user.is_admin?
    else
      redirect_to root_path
    end
  end

  def authorize_admin
    return unless current_user.role != Role.find_by_name("ADMIN")
    redirect_to root_path, alert: 'Acesso Negado'
  end

  protected

  # def sign_up(resource_name, resource)
  #   true
  # end
end
