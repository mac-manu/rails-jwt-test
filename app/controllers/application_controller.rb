class ApplicationController < ActionController::API
    include JsonWebToken

    before_action :authenticate_request #, except: [:index, :show]

    private
        def authenticate_request
            header = request.headers['Authorization']
            header = header.split(' ').last if header
            decode = jwt_decode(header)
            @current_user = User.find(decode['user_id'])
        end
end
