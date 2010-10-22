# Will Paginate Renderers

A collection of custom renderers for use with the
[will_paginate](http://github.com/mislav/will_paginate) view helper.

## Renderers Provided

### Gmail

![](http://img.skitch.com/20101022-kf5u89brk4q66rfiyc2xs4wyug.jpg)

### Twitter

![](http://img.skitch.com/20101022-gsii3yq94kex2f2tgwnwuf1k8j.jpg)

## Usage

will_paginate_renderers requires the development version of will_paginate,
which is currently 3.0.pre2

### Rails 3

**Gemfile**

    gem 'will_paginate_renderers'

**Views**

    # Use the Twitter renderer
    will_paginate(@posts, :renderer => WillPaginateRenderers::Twitter.new)

## Note on Patches/Pull Requests

* Fork
* Code
* Commit
* Push
* Pull Request

## Copyright

Copyright (c) 2010 Robert Speicher. See LICENSE for details.
