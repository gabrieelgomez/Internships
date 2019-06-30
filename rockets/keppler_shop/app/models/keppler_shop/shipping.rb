# frozen_string_literal: true

module KepplerShop
  # Shipping Model
  class Shipping < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid

    def self.index_attributes
      %i[company_name sucursal_name]
    end
  end
end
