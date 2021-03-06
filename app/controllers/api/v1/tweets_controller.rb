module Api
    module V1
        class TweetsController < ApiController
            before_action :get_tweet, only: [:show, :destroy]

            #GET api/v1/tweets
            def index
                #@tweets = Tweet.where(user_id: current_user.id)
                @tweets = current_user.tweets
                render json: @tweets

                #@tweets = current_user.tweets
            end
        
            #GET api/v1/tweets/:id
            def show
                render json: @tweet
                # if tweet
                #     render json: @tweet
                # else
                #     render json: {error: 'Tweet not found', status: 404}
                # end
            end
        
            def src_hashtag
                @hashtag = []
                @texto = []
                @tweet = Tweet.all
                @tweet.each do |tweet|
                    @hashtag = tweet.text.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}  
                    @hashtag.each do |hashtag|
                        if hashtag == params[:text]
                            @texto << tweet
                        end
                    end  
                end
                render json: @texto
            end

            #POST /api/v1/tweets
            #params(text: "", username: "", user_id: "")
            def create
                @tweet = Tweet.new(tweet_params)
                @tweet.user_id = current_user.id
                @tweet.username = current_user.username
                
                if @tweet.save
                    render json: @tweet, status: :ok
                #     redirect_to tweets_path, notice: "¡Tweet posted!:D"
                else
                    message_error = " "
                    @tweet.errors.full_messages.each do |error|
                        message_error = message_error + " " + error
                    end
                    render error: {error: "message_error", status: 400}
                end
            end


            #DELETE /api/v1/tweets/:id
            def destroy
                @tweet.destroy
                #Destruir el tweet y no hacer nada: 
                #head :no_content
                render json: {response: "Tweet deleted"}, status: 200
            end
        
            private
        
            def tweet_params
                params.require(:tweet).permit(:text)
            end

            def get_tweet
                @tweet = Tweet.find(params[:id])
            end

        end
    end
end

