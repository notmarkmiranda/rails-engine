module Api
  module V1
    class Merchants::FavoriteCustomerController < ApiController
      respond_to :json

      def show
        respond_with Merchant.find(params[:id]).favorite_customer
      end
    end
  end
end
