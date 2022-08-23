class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unpro_ent_res
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def render_unpro_ent_res(invalid)
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end
  
end
