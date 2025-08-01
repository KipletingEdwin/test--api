class ApplicationController < ActionController::API
    before_action :authorize_request
    skip_before_action :authorize_request

    attr_reader :current_person



    private

    def authorize_request 
        header = request.headers['Authorization']
        header = header.split('').last if header
        decoded = JsonWebToken.decode(header)
        @current_person = Person.find_by(id: decoded[:person_id]) if decoded
        rescue 
            render json: {  error: 'Unauthorized'  },status: :unauthorized

    end
end
