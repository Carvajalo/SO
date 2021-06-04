module Api
    module V1



        class LikesController < ApiController
            def create
                @like = Like.new(like_params)
                @like.by_id = current_user.id
                @tweet_likes_count = @like.tweet
                @tweet_likes_count.likes_count = @tweet_likes_count.likes_count + 1
                @tweet_likes_count.save
                if @like.save
                    render json: @like, status: :ok
                else 
                    head :no_content
                end
            end

            private
            def like_params
                params.require(:like).permit(:liked_id)
            end
    


        end


     


end
end
