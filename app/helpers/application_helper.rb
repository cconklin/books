module ApplicationHelper
  
  def tag_path(tag)
    if params[:tags] && params[:tags].respond_to?(:map)
      books_path(tags: params[:tags].map(&:to_i).append(tag.id).uniq)
    else
      books_path(tags: (Array tag.id))
    end
  end
  
  def remove_tag_path(tag)
    return books_path unless params[:tags].respond_to?(:map)
    tag_ids = params[:tags].map(&:to_i)
    tag_ids.delete(tag.id)
    tag_ids.empty? ? books_path : books_path(tags: tag_ids)
  end
  
end

