module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json

      def model
        Merchant
      end


      private

        def s_params
          params.require(:merchant).permit(:id, :name, :created_at, :updated_at)
        end

    end
  end
end
