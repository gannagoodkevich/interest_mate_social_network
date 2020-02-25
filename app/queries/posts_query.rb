class PostsQuery
  def initialize(posts)
    @visible_posts = posts
  end

  def search_posts(parameter, searching_part)
    parameter = 'title' if parameter.nil?
    @posts = []
    case parameter
    when 'title'
      @posts = @visible_posts.where('title LIKE ?', "%#{searching_part}%")
    when 'content'
      @posts = @visible_posts.where('content LIKE ?', "%#{searching_part}%")
    when 'author'
      @posts = user_posts_search(searching_part)
    end
  end

  def user_posts_search(searching_part)
    users = User.where('nickname LIKE ?', "%#{searching_part}%")
    @posts = []
    users.each do |user|
      user.posts.visible.records.each do |post|
        @posts << post
      end
    end
    @posts
  end
end
