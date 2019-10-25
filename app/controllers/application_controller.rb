class ApplicationController < ActionController::API
    # controller classes don't know about these helpers yet
    # so including these modules to application controller
    include Response
    include ExceptionHandler
end
