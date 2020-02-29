class PostUpdatingService
  def initialize(post)
    @post = post
  end

  def call(post_params)
    @post.update!(title: post_params[:title], content: post_params[:content], status: post_params[:status])
    update_category(post_params[:category_id])
    update_tag(post_params[:tags])
  end

  private

  def update_category(category_params)
    @post.post_categories.each(&:delete)
    @post.categories << Category.find_by(id: category_params)
  end

  def update_tag(tag_params)
    @post.post_tags.each(&:delete)
    tags = tag_params.split(',')
    puts tags.inspect
    tags.each do |tag_name|
      tag = Tag.find_by_name(tag_name)
      @post.tags << tag unless tag.nil?
    end
  end
end