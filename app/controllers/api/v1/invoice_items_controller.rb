module Api
  module V1
    class InvoiceItemsController < ApiController
      include ApiMethods
      respond_to :json

      def model
        InvoiceItem
      end

      private
        def s_params
          params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
        end

    end
  end
end
