module Api
  module V1
    class ItemsController < ApiController
      respond_to :json

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find_by(id: params[:id])
      end

      def create
        respond_with Item.create(item_params), location: nil
      end

      def update
        respond_with Item.update(params[:id], item_params), location: nil
      end

      def destroy
        respond_with Item.delete(params[:id])
      end

      private

        def item_params
          params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
        end

    end
  end
end
