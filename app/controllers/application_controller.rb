class ApplicationController < ActionController::Base
    def hello
        render text:"Hi there!"
    end 
end
