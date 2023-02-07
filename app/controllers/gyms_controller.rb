class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :rescue_record_invalid

    def index
        gyms = Gym.all 
        render json: gyms 
    end

    def show 
        gym = Gym.find(params[:id])
        render json: gym
    end
    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end
    private
    def rescue_record_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end
    def rescue_record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
