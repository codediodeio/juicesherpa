class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  #  def create
  #   super
  #  end

  # GET /resource/edit
  def edit
    if current_user.soft_user?
      redirect_to new_user_registration_path
    else
      super
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    if current_user.recipes.present?
      recipes = current_user.recipes
      recipes.map do |r|
        r.destroy
      end
      super
    else
      super
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    merge_soft_recipes
    super
  end


  def merge_soft_recipes
    #soft_user_token = session[:soft_user_token]
    recipes = Recipe.where(soft_user_token: current_user.soft_user_token)
    recipes.map do |r|
      r.user = current_user
      r.user_id = current_user.id
      r.save!
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
