class TodosController < ApplicationController
    # auth defined in app conroler 
    before_action :authenticatio

    #get /todos
    def index
        @todos = Todo.all
        render json: @todos
    end
end
