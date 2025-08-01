class PeopleController < ApplicationController
    # skip_before_action :authorize_request, only: [:create]
  
    def create
      person = Person.new(person_params)
      if person.save
        render json: { message: 'Person created' }, status: :created
      else
        render json: { errors: person.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def person_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
  