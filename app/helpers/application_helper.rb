require 'navigation_helper.rb'

module ApplicationHelper
  include NavigationHelper

  def base_title
    @base_title = "WerqBook"
  end

end
