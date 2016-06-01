module Api
  module V1
    class InvoicesController < ApiController
      respond_to :json

      def model
        Invoice
      end

      private
        def s_params
          params.require(:invoice).permit(:id, :customer_id, :merchant_id, :status)
        end

    end
  end
end
