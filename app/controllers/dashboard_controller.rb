class DashboardController < ApplicationController
    def index
        @activeInventory = Station.sum(:count)
    end
end
