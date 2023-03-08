class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]

  

  def after_sign_up_path_for(resource)
     users_sign_in_path
  end


  def after_sign_in_path_for(resource)
    products_path
  end

# rescue_from cancan: :AccessDenied do |exception|
#   render json: {warning: exception, status: "authorization failed"}
# end

end
