class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, "superCoolSecret", 'HS256')
    end

    def auth_header
        # {AuthorizationL 'Bearer <token>'}
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1].chomp

            # header: {'Authorization': 'Bearer <token>'}
            begin
                JWT.decode(token, "superCoolSecret", true, { algorithm: 'HS256' })
            rescue => e 
                p "ERROR: " + e.message
                nil
            end
        end
    end

    def logged_in_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!logged_in_user
    end
    
    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
