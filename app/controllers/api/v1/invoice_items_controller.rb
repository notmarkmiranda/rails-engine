module Api
  module V1
    class InvoiceItemsController < ApiController
      respond_to :json

      def model
        InvoiceItem
      end

      private
        def s_params
          params.require(:invoice_item).permit(:id, :item_id, :invoice_id, :quantity, :unit_price)
        end

    end
  end
end
