module Api
    module V1
      class UsersController < ApiController
              
        def create
              begin
            @user=User.new(user_params)
            if @user.save
              render json: {user: @user, message: "User created",  status: 200}
            else
                render json: { error:"User already exist.", status: 400 } 
                      end
                  rescue
                      render json: { error:"User already exist.", status: 400 } 
                  end
          end
  
        def login
          @user=User.where(email: params[:email]).first
  
          if @user && @user.valid_password?(params[:password])
            render json: {user: @user} 
          else
            render json: { error: "Email or password incorrect", status: 400 } 
          end
        end
              
        # t.belongs_to :liked, class_name: "Tweet"
        # t.belongs_to :by, class_name: "User"

        def destroy
          current_user.unfollow(@user)
          redirect_back fallback_location: "/"
        end
  
        private
        def user_params
            params.permit(:email,:password, :username, :name)
        end

        def tweet_params
            params.require(:tweet).permit(:id)
        end


          end        
      end    
  end