module Api
  module V1
    class Transactions::InvoicesController < ApiController
      respond_to :json

      def show
        respond_with Transaction.find_by(id: params[:id]).invoice
      end
    end
  end
end
