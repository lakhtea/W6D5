class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def create 
        
    end

    def show 

    end

    def edit

    end

    def new

    end

    def update
    
    end
end