module Api
  module V1
    class Invoices::CustomersController < ApiController
      respond_to :json

      def show
        respond_with Invoice.find_by(id: params[:id]).customer
      end
      
    end
  end
end
