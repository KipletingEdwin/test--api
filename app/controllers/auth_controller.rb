class AuthController < ApplicationController
    def login
        person = Person.find_by(email: params[:email])
        if person&.authenticate(params[:password])
            token = JsonWebToken.encode(person_id: person.id)
            render json: {token: token}, status: :ok 
        else
            render json: { error: 'Invalid email or password'}, status: :unauthorized
        end

    end
end
