module Api
  module V1
    class ItemsController < ApiController
      include ApiMethods
      # before_action :change_currency
      respond_to :json

      def model
        Item
      end

      private

        def s_params
          params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
        end

        # def change_currency
        #   if params[:unit_price]
        #     params[:unit_price] = (params[:unit_price].to_f * 100).round
        #   end
        # end
    end
  end
end
