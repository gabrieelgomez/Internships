# frozen_string_literal: true

module KepplerShop
  # Reservation Model
  class Reservation < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    belongs_to :product
    belongs_to :shipping
    acts_as_list
    acts_as_paranoid

    def self.index_attributes
      %i[full_name dni email phone country product_name]
    end
  end
end
