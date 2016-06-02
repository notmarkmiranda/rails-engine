module Api
  module V1
    class InvoicesController < ApiController
      include ApiMethods

      respond_to :json

      def model
        Invoice
      end

      private
        def s_params
          params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
        end

    end
  end
end
