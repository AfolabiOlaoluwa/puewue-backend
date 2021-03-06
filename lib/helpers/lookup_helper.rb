#
#  Copyright (c) 2014, Facebook, Inc.
#  All rights reserved.
#
#  This source code is licensed under the BSD-style license found in the
#  LICENSE file in the root directory of this source tree. An additional grant
#  of patent rights can be found in the PATENTS file in the same directory.
#

require "power/timeline"

module LookupHelper
  def center_lookup
    settings.center_lookup
  end

  def search_provider
    Tire.search(settings.index_name)
  end

  def cache_provider
    settings.cache_provider
  end

  def datacenter_by_slug(slug)
    center_lookup.by_slug(slug)
  end

  def first_datacenter
    @first_datacenter ||= center_lookup.first
  end

  def timeline_for(datacenter, period)
    timeline = Power::Timeline.new(search_provider, datacenter, period)
    timeline.cache_provider = cache_provider

    timeline
  end
end
