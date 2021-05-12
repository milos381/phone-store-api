class Phone < ApplicationRecord
    has_one :rating
    has_one :description
end
