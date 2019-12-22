class Station < ApplicationRecord
    has_many :station_statuses
    belongs_to :area
end
