class ApplicationController < ActionController::API
    # controller classes don't know about these helpers yet
    # so including these modules to application controller
    include Response
    include ExceptionHandler

    # called before every action on controllers
    before_action :authorize_request
    attr_reader :current_user

    private

    # Check for valid request token and return user
    def authorize_request
        @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
    end
end
