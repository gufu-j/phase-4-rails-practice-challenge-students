class StudentsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
        
    def index 
        students =  Student.all
        render json: students
    end

    def show
        student = Student.find(params[:id])
        render json: student
    end

    def create
        student = Student.create!(students_params)
        render json: student, status: :created
    end

    def destroy 
        student = find_student
        student.destroy
        head :no_content
    end

    def update 
        student = find_student
        student.update(students_params)
        render json: student
    end

    



    private 

    def find_student
        Student.find(params[:id])
    end

    def render_not_found_response 
        render json: {error: "Student not found"}, status: :not_found
    end

    def students_params
        params.permit(:name, :age, :major)
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
