
# frozen_string_literal: true

require_dependency "keppler_shop/application_controller"
module KepplerShop
  module Admin
    # ShippingsController
    class ShippingsController < ::Admin::AdminController
      layout 'keppler_shop/admin/layouts/application'
      before_action :set_shipping, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /shops
      def index
        respond_to_formats(@shippings)
        redirect_to_index(@objects)
      end

      # GET /shops/1
      def show; end

      # GET /shops/new
      def new
        @shipping = Shipping.new
      end

      # GET /shops/1/edit
      def edit; end

      # POST /shops
      def create
        @shipping = Shipping.new(shipping_params)

        if @shipping.save
          redirect(@shipping, params)
        else
          render :new
        end
      end

      # PATCH/PUT /shops/1
      def update
        if @shipping.update(shipping_params)
          redirect(@shipping, params)
        else
          render :edit
        end
      end

      def clone
        @shipping = Shipping.clone_record params[:shipping_id]
        @shipping.save
        redirect_to_index(@objects)
      end

      # DELETE /shops/1
      def destroy
        @shipping.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Shipping.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Shipping.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Shipping.sorter(params[:row])
      end

      private

      def index_variables
        @q = Shipping.ransack(params[:q])
        @shippings = @q.result(distinct: true)
        @objects = @shippings.page(@current_page).order(position: :asc)
        @total = @shippings.size
        @attributes = Shipping.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_shipping
        @shipping = Shipping.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def shipping_params
        params.require(:shipping).permit(
          :company_name, :sucursal_name
        )
      end
    end
  end
end
