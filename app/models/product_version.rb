class ProductVersion < ApplicationRecord
  belongs_to :product
  serialize :data, Hash
end
