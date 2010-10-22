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
  class Twitter < ::WillPaginate::ViewHelpers::LinkRenderer
    def pagination
      [:next_page]
    end

    protected

    def next_page
      return unless @collection.next_page

      previous_or_next_page(@collection.next_page,
                            WillPaginateRenderers.pagination_options[:twitter_label],
                            WillPaginateRenderers.pagination_options[:twitter_class])
    end
  end
end
