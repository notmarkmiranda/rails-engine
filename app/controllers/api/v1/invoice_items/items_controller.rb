module Api
  module V1
    class InvoiceItems::ItemsController < ApiController
      respond_to :json

      def show
        respond_with InvoiceItem.find_by(id: params[:id]).item
      end
      
    end
  end
end
