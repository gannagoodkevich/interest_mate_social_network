class PostCreatingService
  def initialize(user)
    @user = user
  end

  def call(post_params)
    @post = @user.posts.create!(title: post_params[:title], content: post_params[:content])
    add_status(post_params[:status])
    add_category(post_params[:category_id])
    add_tag(post_params[:tags])
  end

  private

  def add_status(status_params)
    if status_params == 'visible'
      @post.visible!
    else
      @post.unvisible!
    end
  end

  def add_category(category_params)
    @post.categories << Category.find_by(id: category_params)
  end

  def add_tag(tag_params)
    tags = tag_params.split(',')
    puts tags.inspect
    tags.each do |tag_name|
      tag = Tag.find_by_name(tag_name)
      @post.tags << tag unless tag.nil?
    end
  end
end
