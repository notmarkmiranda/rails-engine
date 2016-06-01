module Api
  module V1
    class ItemsController < ApiController
      respond_to :json

      def model
        Item
      end

      private

        def s_params
          params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
        end

    end
  end
end
