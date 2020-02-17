class TagsController < ApplicationController
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
