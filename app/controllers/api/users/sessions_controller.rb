# frozen_string_literal: true

module Api
  module Users
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token
      respond_to :json

      def respond_with(_resource, _opt = {})
        if current_user
          return render json: { id: current_user.id, email: current_user.email,
                                cart: current_user.carts.first.as_json(include: {
                                                                         products: { include: :unit }, carts_products: {}
                                                                       }) },
                        status: :ok
        end

        render json: { error: 'Auth error.' }, status: :unauthorized
      end
    end
  end
end
