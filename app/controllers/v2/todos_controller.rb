class V2::TodosController < ApplicationController
    def index
        json_response({ message: 'HEllo there'})
    end
end
