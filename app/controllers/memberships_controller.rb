class MembershipsController < ApplicationController

	def create
		membership = Membership.create!(memberships_params)
		render json: membership, status: :created
	end

	private

	def memberships_params
		params.permit(:gym_id, :client_id, :charge)
	end

end
