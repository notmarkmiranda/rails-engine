class Api::ApiController < ApplicationController
  # inheriting, gets access to application controller
  # but can change definitions
  # protect from forgery
  protect_from_forgery with: :null_session
  before_action :change_currency

  private

  def change_currency
    if params[:unit_price]
      params[:unit_price] = (params[:unit_price].to_f * 100).round
    end
  end

end
