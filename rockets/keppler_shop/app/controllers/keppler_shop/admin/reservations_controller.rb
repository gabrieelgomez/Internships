
# frozen_string_literal: true

require_dependency "keppler_shop/application_controller"
module KepplerShop
  module Admin
    # ReservationsController
    class ReservationsController < ::Admin::AdminController
      layout 'keppler_shop/admin/layouts/application'
      before_action :set_reservation, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /shops
      def index
        respond_to_formats(@reservations)
        redirect_to_index(@objects)
      end

      # GET /shops/1
      def show; end

      # GET /shops/new
      def new
        @reservation = Reservation.new
      end

      # GET /shops/1/edit
      def edit; end

      # POST /shops
      def create
        @reservation = Reservation.new(reservation_params)

        if @reservation.save
          redirect(@reservation, params)
        else
          render :new
        end
      end

      # PATCH/PUT /shops/1
      def update
        if @reservation.update(reservation_params)
          redirect(@reservation, params)
        else
          render :edit
        end
      end

      def clone
        @reservation = Reservation.clone_record params[:reservation_id]
        @reservation.save
        redirect_to_index(@objects)
      end

      # DELETE /shops/1
      def destroy
        @reservation.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Reservation.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Reservation.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Reservation.sorter(params[:row])
      end

      private

      def index_variables
        @q = Reservation.ransack(params[:q])
        @reservations = @q.result(distinct: true)
        @objects = @reservations.page(@current_page).order(position: :asc)
        @total = @reservations.size
        @attributes = Reservation.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def reservation_params
        params.require(:reservation).permit(
          :full_name, :dni, :email, :phone, :country, :product_name, :product_id
        )
      end
    end
  end
end
