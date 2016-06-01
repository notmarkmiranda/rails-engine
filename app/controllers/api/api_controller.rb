class Api::ApiController < ApplicationController
  # inheriting, gets access to application controller
  # but can change definitions
  # protect from forgery
  protect_from_forgery with: :null_session
  def index
    respond_with model.all
  end

  def show
    respond_with model.find_by(id: params[:id])
  end

  def create
    respond_with model.create(s_params), location: nil
  end

  def update
    respond_with model.update(params[:id], s_params), location: nil
  end

  def destroy
    respond_with model.delete(params[:id])
  end

  def find
    respond_with model.find_by(s_params)
  end

  def find_all
    respond_with model.where(s_params)
  end

end
