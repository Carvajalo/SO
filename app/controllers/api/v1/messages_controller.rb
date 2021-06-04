module Api 
    module V1
        class MessagesController < ApiController
            before_action do
                @conversation = Conversation.find(params[:conversation_id])
            end
            
            def index
                @messages = @conversation.messages  
                render json: @messages
            end

            

            def show
                @message = Conversation.message.find(params[:id])
                render json: @message
            end

            def create
                @message = @conversation.message.new(message_params)
                @message.user_id = current_user.id
                if @message.save
                    render json: @message, status: :ok

                else
                    message_error = " "
                    @message.errors.full_messages.each do |error|
                        message_error = message_error + " " + error
                    end
                    render error: {error: "message_error", status: 400}
                end
            end

            private
            def message_params
              params.require(:message).permit(:body)
            end



        end
    end
end
