module Api
  module V1
    class Items::MostItemsController < ApiController
      respond_to :json

      def index
        respond_with Item.ranked_items_sold(params[:quantity])
      end
      
    end
  end
end
