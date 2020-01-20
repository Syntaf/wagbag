class SmsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def inbound
        # TODO
    end
end
