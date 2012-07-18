module Refinery
  module Blog
    class BlogController < ::ApplicationController

      include ControllerHelper

      helper :'refinery/blog/posts'
      before_filter :find_page, :find_all_blog_categories

      protected

        def find_page
          @page = Refinery::Page.find_by_link_url("/award_winners")
        end
    end
  end
end
