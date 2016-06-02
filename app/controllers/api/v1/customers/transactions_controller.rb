module Api
  module V1
    class Customers::TransactionsController < ApiController
      respond_to :json

      def index
        respond_with Customer.find_by(id: params[:id]).transactions
      end
    end
  end
end
