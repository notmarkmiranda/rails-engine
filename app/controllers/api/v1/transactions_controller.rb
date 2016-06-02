module Api
  module V1
    class TransactionsController < ApiController
      include ApiMethods

      respond_to :json

      def model
        Transaction
      end

      private
        def s_params
          params.permit(:id, :invoice_id, :credit_card_number, :credit_card_exp, :result, :updated_at, :created_at)
        end


    end
  end
end
