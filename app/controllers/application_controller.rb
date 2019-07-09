class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(err)
    render json: { errors: [{ detail: err.message }], status: :not_found }
  end

end
