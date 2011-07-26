# Will Paginate Renderers ![](http://stillmaintained.com/tsigo/will_paginate_renderers.png)

A collection of custom renderers for use with the
[will_paginate](http://github.com/mislav/will_paginate) gem.

## Requirements

will_paginate_renderers currently depends explicitly on [will_paginate
3.0.pre4](https://rubygems.org/gems/will_paginate/versions/3.0.pre4), but will
in the future support any 3.0.x version once a stable version is released.

The easiest way to make use of will_paginate_renderers is through
[Bundler](http://gembundler.com/) by adding the following to your Gemfile:

    gem 'will_paginate'
    gem 'will_paginate_renderers'

Note that although `will_paginate_renderers` lists `will_paginate` as a
dependency, you still need it in your Gemfile in order to make sure it's
required properly.

Once installed, just tell the `will_paginate` helper which renderer to use (see
below).

## Renderers Provided

### Gmail

**Preview**:

![](http://img.skitch.com/20101022-kf5u89brk4q66rfiyc2xs4wyug.jpg)

**Usage**:

    will_paginate(@posts, :renderer => WillPaginateRenderers::Gmail)

#### Customization

You can change the label and CSS class of the "Newest", "Newer", "Older" and
"Oldest" links, and you can change the CSS class of the "window" span, which is
the text that shows the current, end and total counts.

    WillPaginateRenderers.pagination_options[:gmail_newest_label] = "Newest"
    WillPaginateRenderers.pagination_options[:gmail_newer_label]  = "Newer"
    WillPaginateRenderers.pagination_options[:gmail_older_label]  = "Older"
    WillPaginateRenderers.pagination_options[:gmail_oldest_label] = "Oldest"

    WillPaginateRenderers.pagination_options[:gmail_newest_class] = 'newest'
    WillPaginateRenderers.pagination_options[:gmail_newer_class]  = 'newer'
    WillPaginateRenderers.pagination_options[:gmail_older_class]  = 'older'
    WillPaginateRenderers.pagination_options[:gmail_oldest_class] = 'oldest'
    WillPaginateRenderers.pagination_options[:gmail_window_class] = 'window'

### Twitter

**Preview**:

![](http://img.skitch.com/20101022-gsii3yq94kex2f2tgwnwuf1k8j.jpg)

**Usage**:

    will_paginate(@posts, :renderer => WillPaginateRenderers::Twitter)

#### Customization

You can change the label and CSS class of the "More" link.

    WillPaginateRenderers.pagination_options[:twitter_label] = "View More"

    WillPaginateRenderers.pagination_options[:twitter_class] = 'custom_css'

## Note on Patches/Pull Requests

* Fork
* Code
* Commit
* Push
* Pull Request

Please feel free to fork and add your own renderers. Be sure to send a pull
request when you're done! If you're not able or willing to add one yourself,
feature requests are more than welcome; just open a new issue.

## Copyright

Copyright (c) 2010 Robert Speicher. See LICENSE for details.
