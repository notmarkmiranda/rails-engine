module Api
  module V1
    class InvoiceItems::InvoicesController < ApiController
      respond_to :json

      def show
        respond_with InvoiceItem.find_by(id: params[:id]).invoice
      end
    end
  end
end
