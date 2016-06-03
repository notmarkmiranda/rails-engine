module Api
  module V1
    class Items::MostRevenueController < ApiController
      respond_to :json

      def index
        respond_with Item.ranked_revenue(params[:quantity])
      end
      
    end
  end
end
