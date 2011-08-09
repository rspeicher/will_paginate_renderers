module WillPaginateRenderers
  # = Gmail
  #
  # A custom WillPaginate link renderer that emulates the Gmail-style
  # Oldest, Older, (info), Newer, Newest links
  #
  # == Customization
  #
  # Changing the labels:
  #   WillPaginateRenderers.pagination_options[:gmail_newest_label] = "Newest"
  #   WillPaginateRenderers.pagination_options[:gmail_newer_label]  = "Newer"
  #   WillPaginateRenderers.pagination_options[:gmail_older_label]  = "Older"
  #   WillPaginateRenderers.pagination_options[:gmail_oldest_label] = "Oldest"
  #
  # Changing the CSS class of the links:
  #   WillPaginateRenderers.pagination_options[:gmail_newest_class] = 'newest'
  #   WillPaginateRenderers.pagination_options[:gmail_newer_class]  = 'newer'
  #   WillPaginateRenderers.pagination_options[:gmail_older_class]  = 'older'
  #   WillPaginateRenderers.pagination_options[:gmail_oldest_class] = 'oldest'
  #   WillPaginateRenderers.pagination_options[:gmail_window_class] = 'window'
  #
  # == Option Defaults
  #
  # * +gmail_newest_label+: "&laquo; Newest"
  # * +gmail_newer_label+: "&lt; Newer"
  # * +gmail_older_label+: "Older &gt;"
  # * +gmail_oldest_label+: "Oldest &raquo;"
  # * +gmail_newest_class+: "gmail_newest"
  # * +gmail_newer_class+: "gmail_newer"
  # * +gmail_older_class+: "gmail_older"
  # * +gmail_oldest_class+: "gmail_oldest"
  # * +gmail:window_class+: "gmail_window"
  class Gmail < ::WillPaginate::ActionView::LinkRenderer

    def pagination
      [:newest, :newer, :window, :older, :oldest]
    end

    protected

    def newest
      return unless @collection.current_page > 2

      previous_or_next_page(1,
                            WillPaginateRenderers.pagination_options[:gmail_newest_label],
                            WillPaginateRenderers.pagination_options[:gmail_newest_class])
    end

    def newer
      if previous_page = @collection.current_page > 1 && @collection.current_page - 1
        previous_or_next_page(previous_page,
                              WillPaginateRenderers.pagination_options[:gmail_newer_label],
                              WillPaginateRenderers.pagination_options[:gmail_newer_class])
      end
    end

    def older
      if next_page = @collection.current_page < @collection.total_pages && @collection.current_page + 1
        previous_or_next_page(next_page,
                              WillPaginateRenderers.pagination_options[:gmail_older_label],
                              WillPaginateRenderers.pagination_options[:gmail_older_class])
      end
    end

    def oldest
      return unless @collection.current_page < @collection.total_pages - 1

      previous_or_next_page(@collection.total_pages,
                            WillPaginateRenderers.pagination_options[:gmail_oldest_label],
                            WillPaginateRenderers.pagination_options[:gmail_oldest_class])
    end

    # Renders the "x - y of z" text
    def window
      base = @collection.offset
      high = base + @collection.per_page
      high = @collection.total_entries if high > @collection.total_entries

      # TODO: What's the best way to allow customization of this text, particularly "of"?
      tag(:span, " #{base + 1} - #{high} of #{@collection.total_entries} ",
          :class => WillPaginateRenderers.pagination_options[:gmail_window_class])
    end
  end
end
