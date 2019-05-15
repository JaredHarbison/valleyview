require 'navigation_helper.rb'

module ApplicationHelper
  include NavigationHelper
  include PostsHelper

  def base_title
    @base_title = "WerqBook"
  end

end
