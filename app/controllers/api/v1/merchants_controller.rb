module Api
  module V1
    class MerchantsController < ApiController
      include ApiMethods

      respond_to :json

      def model
        Merchant
      end


      # user subdirectories
      # def items
      #   respond_with model.find(params[:id]).items
      # end
      #
      # def invoices
      #   respond_with model.find(params[:id]).invoices
      # end

      private

        def s_params
          params.permit(:id, :name, :created_at, :updated_at)
        end

    end
  end
end
