require_dependency "keppler_frontend/application_controller"

module KepplerFrontend
  class App::FrontendController < App::AppController
    include FrontsHelper
    layout 'layouts/keppler_frontend/app/layouts/application'
    before_action :set_product, only: %i[product reservation]

    def index
      @products = KepplerShop::Product.all
    end

    def about
    end

    def blog
    end

    def blog_details
    end

    def cart
    end

    def checkout
    end

    def contact
    end

    def error404
    end

    def faq
    end

    def my_account
    end

    def portfolio
    end

    def portfolio_details
    end

    def shop_grid
    end

    def product; end

    def reservation
      @reservation = KepplerShop::Reservation.new
    end

    def team
    end

    def wishlist
    end


    private

    def set_product
      @product = KepplerShop::Product.find_by id: params[:product_id]
    end

  end
end
