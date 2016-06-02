module Api
  module V1
    class Merchants::MostRevenueController < ApiController
      respond_to :json

      def index
        respond_with Merchant.ranked_revenue(params[:quantity])
      end
    end
  end
end
