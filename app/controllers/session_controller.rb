class SessionController < ApplicationController
    
    def signup
        user = User.new(email: params["email"], password: params[:password])

        # if user is saved 
        if user.save
            # create token 
            token = encode_user_data(user_data: user.id)
            # return token 
            render json: { token: token }
        else
            render json: { message: "invalid users "}, status: :unauthorized
        end

    end

    def login
        user = User.find_by(email: params[:email])

        # bycrypt password ? maybe later 
        if user && user.password == params[:password]
            # encript stuff 
            token = encode_user_data({user_data: user.id })
            render json: { token: token }
        else
            render json: { message: "invalid users "}, status: :unauthorized
        end
    end

end