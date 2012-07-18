module Refinery
  class BlogSweeper < ActionController::Caching::Sweeper
    observe Blog::Post, Blog::Comment

    def after_create(record)
      expire_cache_for(record)
    end

    def after_update(record)
      expire_cache_for(record)
    end

    def after_destroy(record)
      expire_cache_for(record)
    end

    private

      def expire_cache_for(record)
        # TODO: Convert these to url helpers
        expire_page '/award_winners'
        expire_page '/award_winners/feed.rss'
      end

  end
end
