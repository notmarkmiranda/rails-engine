module Api
  module V1
    class CustomersController < ApiController
      include ApiMethods
      respond_to :json

      def model
        Customer
      end

      private
        def s_params
          params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
        end

    end
  end
end
