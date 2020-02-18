class TagsController < ApplicationController
  def index
    @tag = Tag.new
  end

  def show
    render 'index'
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @post.tags << Tag.create!(name: params[:name])
    respond_to do |format|
      format.js
    end
  end

  def autocomplete
    render json: Tag.search(params[:query], {
        fields: ["name"],
        match: :word_start,
        limit: 10,
        load: false,
        misspellings: {below: 5}
    }).map(&:name)
  end
end
