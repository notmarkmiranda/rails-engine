module Api
  module V1
    class CustomersController < ApiController
      respond_to :json

      def model
        Customer
      end

      private
        def s_params
          params.require(:customer).permit(:first_name, :last_name)
        end

    end
  end
end
