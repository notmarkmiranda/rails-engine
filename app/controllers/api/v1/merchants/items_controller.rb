module Api
  module V1
    class Merchants::ItemsController < ApiController
      respond_to :json

      def index
        respond_with Merchant.find_by(id: params[:id]).items
      end

    end
  end
end
