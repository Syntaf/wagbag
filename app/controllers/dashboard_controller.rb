class DashboardController < ApplicationController
    def index
        @activeInventory = Station.sum(:count)
        @latestStationStatuses = StationStatus.joins(:station)
    end

    def list
        @allStationStatuses = StationStatus.joins(:station)
    end
end
