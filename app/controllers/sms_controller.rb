class SmsController < ApplicationController
    def inbound
        logger.debug params
    end
end
