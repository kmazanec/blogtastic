
helpers do

  def format_tags(tags)
    # takes a bunch of comma separated tags in a string
    # formats them and returns an array of lower-case strings
    tags.split(',').map do |tag|
      tag.strip.downcase
    end
  end

end