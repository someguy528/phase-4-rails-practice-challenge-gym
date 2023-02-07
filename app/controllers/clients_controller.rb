class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :rescue_record_invalid
    def index
        clients = Client.all 
        render json: clients
    end
    def show
        client = Client.find(params[:id])
        render json: {
            id: client.id, 
            name: client.name, 
            age: client.age, 
            total_charges: client.compute_charges
        }
    end
    private
    def rescue_record_not_found
        render json: {error: "Client not found"}, status: :not_found
    end
    def rescue_record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
