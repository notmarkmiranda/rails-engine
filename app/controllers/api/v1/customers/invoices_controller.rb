module Api
  module V1
    class Customers::InvoicesController < ApiController
      respond_to :json

      def index
        respond_with Customer.find_by(id: params[:id]).invoices
      end
      
    end
  end
end
