module Api
  module V1
    class TransactionsController < ApiController
      respond_to :json

      def model
        Transaction
      end

      private
        def s_params
          params.require(:transaction).permit(:id, :invoice_id, :credit_card_number, :credit_card_exp, :result)
        end


    end
  end
end
