class PagesController < ApplicationController

  def index
    @hobby_posts = Post.by_branch('hobby').limit(8)
    @study_posts = Post.by_branch('study').limit(8)
    @team_posts = Post.by_branch('team').limit(8)
    @apps_posts = Post.by_branch('apps').limit(8)
    @companies_posts = Post.by_branch('companies').limit(8)
    @inventions_posts = Post.by_branch('inventions').limit(8)
  end

end
