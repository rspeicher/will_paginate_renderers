module WillPaginateRenderers
  class SimplePag < ::WillPaginate::ViewHelpers::LinkRenderer
    def pagination
      [ :newer, :older ]
    end

    protected

    def newer
      return unless @collection.previous_page

      previous_or_next_page(@collection.previous_page,
                            WillPaginateRenderers.pagination_options[:simplepag_newer_label],
                            WillPaginateRenderers.pagination_options[:simplepag_newer_class])
    end

    def older
      return unless @collection.next_page

      previous_or_next_page(@collection.next_page,
                            WillPaginateRenderers.pagination_options[:simplepag_older_label],
                            WillPaginateRenderers.pagination_options[:simplepag_older_class])
    end
  end
end
