class ClientsController < ApplicationController

	def index
		clients = Client.all 
		render json: clients, status: :ok
	end

	def show
		client = find_client
		render json: client, status: :ok
	end

	def update
		client = find_client
		client.update!(client_params)
		render json: client, status: :accepted
	end

	private

	def find_client
		Client.find(params[:id])
	end

	def client_params
		params.permit(:name, :age)
	end

	def membership_total
		client = find_client
		client.memberships.sum(:charge)
	end

end
