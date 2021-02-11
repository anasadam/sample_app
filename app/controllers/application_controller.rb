class ApplicationController < ActionController::Base
    def hello
        render text:"Hello world!"
    end 
end
