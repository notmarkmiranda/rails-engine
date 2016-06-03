module Api
  module V1
    class Items::MerchantsController < ApiController
      respond_to :json

      def show
        respond_with Item.find_by(id: params[:id]).merchant
      end
      
    end
  end
end
