module Api
  module V1
    class Merchants::InvoicesController < ApiController
      include ApiMethods
      respond_to :json

      def index
        respond_with Merchant.find_by(id: params[:id]).invoices
      end

    end
  end
end
