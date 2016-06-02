module Api
  module V1
    class Merchants::MostItemsController < ApiController
      respond_to :json

      def index
        respond_with Merchant.ranked_items_sold(params[:quantity])
      end
    end
  end
end
