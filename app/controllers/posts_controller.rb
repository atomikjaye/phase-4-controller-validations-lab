class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unpro_ent_res

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  private
  def render_unpro_ent_res(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end

end
