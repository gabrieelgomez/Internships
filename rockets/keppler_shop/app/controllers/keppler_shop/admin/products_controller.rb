
# frozen_string_literal: true

require_dependency "keppler_shop/application_controller"
module KepplerShop
  module Admin
    # ProductsController
    class ProductsController < ::Admin::AdminController
      layout 'keppler_shop/admin/layouts/application'
      before_action :set_product, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /shops
      def index
        respond_to_formats(@products)
        redirect_to_index(@objects)
      end

      # GET /shops/1
      def show; end

      # GET /shops/new
      def new
        @product = Product.new
      end

      # GET /shops/1/edit
      def edit; end

      # POST /shops
      def create
        @product = Product.new(product_params)

        if @product.save
          redirect(@product, params)
        else
          render :new
        end
      end

      # PATCH/PUT /shops/1
      def update
        if @product.update(product_params)
          redirect(@product, params)
        else
          render :edit
        end
      end

      def clone
        @product = Product.clone_record params[:product_id]
        @product.save
        redirect_to_index(@objects)
      end

      # DELETE /shops/1
      def destroy
        @product.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Product.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Product.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Product.sorter(params[:row])
      end

      private

      def index_variables
        @q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)
        @objects = @products.page(@current_page).order(position: :asc)
        @total = @products.size
        @attributes = Product.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(
          :image, :title, :subtitle, :description, :price, :offer_price, :files
        )
      end
    end
  end
end
