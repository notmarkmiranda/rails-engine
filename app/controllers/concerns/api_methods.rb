module ApiMethods
  extend ActiveSupport::Concern

  def index
    respond_with model.all
  end

  def show
    respond_with model.find_by(id: params[:id])
  end

  def find
    respond_with model.find_by(s_params)
  end

  def find_all
    respond_with model.where(s_params)
  end

  def random
    respond_with model.all.sample
  end

end
