require 'will_paginate/view_helpers/link_renderer'

# = Will Paginate Renderers
#
# A collection of custom renderers for the +will_paginate+ helper.
#
# == Renderers
#
# === Gmail
#
# Oldest/Older and Newer/Newest links as needed, as well as
# "(start) - (end) of (total)" text.
#
# === Twitter
#
# A single "More" button when there are more results in the collection.
module WillPaginateRenderers
  autoload :Gmail,   'will_paginate_renderers/gmail'
  autoload :Twitter, 'will_paginate_renderers/twitter'
  autoload :SimplePag, 'will_paginate_renderers/simplepag'

  def self.pagination_options() @pagination_options; end
  def self.pagination_options=(value) @pagination_options = value; end
  self.pagination_options = {
    :simplepag_newer_label  => "Newer",
    :simplepag_older_label  => "Older",
    :simplepag_newer_class  => "gmail_newer",
    :simplepag_older_class  => "gmail_older",
    
    :twitter_label => 'More',
    :twitter_class => 'twitter_pagination',

    :gmail_newest_label => "&laquo; Newest",
    :gmail_newer_label  => "&lt; Newer",
    :gmail_older_label  => "Older &gt;",
    :gmail_oldest_label => "Oldest &raquo;",
    :gmail_newest_class => "gmail_newest",
    :gmail_newer_class  => "gmail_newer",
    :gmail_older_class  => "gmail_older",
    :gmail_oldest_class => "gmail_oldest",
    :gmail_window_class => "gmail_window",
  }
end
