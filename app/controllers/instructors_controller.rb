class InstructorsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructor = Instructor.find(params[:id])
        render json: instructor
    end

    def create 

    end
    


    private

    def render_not_found_response 
        render json: { error: "Instructor not found"}, status: :not_found 
    end

end
