module Api
  module V1
    class MerchantsController < ApiController
      include ApiMethods
      respond_to :json

      def model
        Merchant
      end

      private

        def s_params
          params.permit(:id, :name, :created_at, :updated_at)
        end

    end
  end
end
