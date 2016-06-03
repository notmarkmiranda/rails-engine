module Api
  module V1
    class Invoices::TransactionsController < ApiController
      respond_to :json

      def index
        respond_with Invoice.find_by(id: params[:id]).transactions
      end
      
    end
  end
end
