# RGeo::GeoJSON

[![Gem Version](https://badge.fury.io/rb/rgeo-geojson.svg)](http://badge.fury.io/rb/rgeo-geojson)
[![Build Status](https://travis-ci.org/rgeo/rgeo-geojson.svg?branch=master)](https://travis-ci.org/rgeo/rgeo-geojson)

`RGeo::GeoJSON` is an optional module for [RGeo](http://github.com/rgeo/rgeo)
that provides GeoJSON encoding and decoding services.

## Summary

RGeo is a key component for writing location-aware applications in the Ruby
programming language. At its core is an implementation of the industry
standard OGC Simple Features Specification, which provides data
representations of geometric objects such as points, lines, and polygons,
along with a set of geometric analysis operations. See the README for the
"rgeo" gem for more information.

`RGeo::GeoJSON` is an optional RGeo add-on module that provides GeoJSON encoding
and decoding services. GeoJSON is an emerging standard format used by many web
services that need to communicate geospatial data. See http://www.geojson.org
for more information.

Example:

```ruby
require 'rgeo/geo_json'

str1 = '{"type":"Point","coordinates":[1,2]}'
geom = RGeo::GeoJSON.decode(str1, :json_parser => :json)
geom.as_text              # => "POINT(1.0 2.0)"

str2 = '{"type":"Feature","geometry":{"type":"Point","coordinates":[2.5,4.0]},"properties":{"color":"red"}}'
feature = RGeo::GeoJSON.decode(str2, :json_parser => :json)
feature['color']          # => 'red'
feature.geometry.as_text  # => "POINT(2.5 4.0)"

hash = RGeo::GeoJSON.encode(feature)
hash.to_json == str2      # => true
```

## Install

`RGeo::GeoJSON` has the following requirements:

* Ruby 1.9.3 or later
* rgeo 0.3.13 or later.

Include in your bundle:

```ruby
gem 'rgeo-geojson'
```

Install RGeo::GeoJSON as a gem:

```sh
gem install rgeo-geojson
```

See the README for the "rgeo" gem, a required dependency, for further installation information.

If you are using Ruby 1.8, use version `0.2.x`.

### To-do list

* Add support for the "bbox" and "crs" elements.

### Development and support

RDoc Documentation is available at http://rdoc.info/gems/rgeo-geojson

Source code is hosted on Github at http://github.com/rgeo/rgeo-geojson

Contributions are welcome. Fork the project on Github.

Report bugs on Github issues at http://github.com/rgeo/rgeo-geojson/issues

### Acknowledgments

RGeo is written by Daniel Azuma (http://www.daniel-azuma.com).

Development is supported by:

* [Pirq](http://www.pirq.com)
* [Neighborland](https://neighborland.com)

### License

Copyright 2014 Daniel Azuma

Copyright 2014 Tee Parham

https://github.com/rgeo/rgeo-geojson/blob/master/LICENSE.txt
