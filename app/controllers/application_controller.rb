class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(err)
    render json: { errors: [{ detail: err.message }], status: :not_found }
  end

  def hello
    render html 'oooollkmlk'
  end
end
