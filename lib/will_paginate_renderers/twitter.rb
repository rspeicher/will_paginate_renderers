module WillPaginateRenderers
  # = Twitter
  #
  # A custom WillPaginate link renderer that emulates the Twitter style
  # "More" link.
  #
  # == Customization
  #
  # Changing the label:
  #   WillPaginateRenderers.pagination_options[:twitter_label] = "View More"
  #
  # Changing the CSS class of the link:
  #   WillPaginateRenderers.pagination_options[:twitter_class] = 'custom_css'
  #
  # == Option Defaults
  #
  # * +twitter_label+: "More"
  # * +twitter_class+: +twitter_pagination+
  class Twitter < ::WillPaginate::ActionView::LinkRenderer

    def pagination
      [:next_page]
    end

    protected

    def next_page
      if next_page = @collection.current_page < @collection.total_pages && @collection.current_page + 1
        previous_or_next_page(next_page,
                              WillPaginateRenderers.pagination_options[:twitter_label],
                              WillPaginateRenderers.pagination_options[:twitter_class])
      end
    end
  end
end
