class InterestsController < ApplicationController
  def index
    @category = InterestCategory.find_by[id: params[category_id]]
    @interests = @category.interests
  end
end
