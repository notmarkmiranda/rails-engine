module Api
  module V1
    class Items::InvoiceItemsController < ApiController
      respond_to :json

      def index
        respond_with Item.find_by(id: params[:id]).invoice_items
      end
      
    end
  end
end
