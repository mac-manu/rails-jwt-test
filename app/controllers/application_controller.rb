class ApplicationController < ActionController::API
    SECRET = "secretToken"

    def authentication
        #make the request 
        decode_data = decode_user_data(request.headers["token"])
        #get user id fron json array 
        user_data = decode_data[0]["user_id"] unless decode_data.nil?
        #user_data = decode_data[0].['user_id'] unless !decode_data
        # find user in ddbb for real user 
        user = User.find(user_data&.id)

        if user 
            return user
        else
            render json: { message: "invalid user "}, status: :unauthorized
        end
    end

    def encode_user_data(payload)
        token = JWT.encode(payload, SECRET, 'HS256')
        return token
    end

    def decode_user_data(token)
        begin  
            data = JWT.decode token, SECRET, true, { algorithm: 'HS256' }
            return data
        rescue => e
            puts e
        end
    end
    
end
