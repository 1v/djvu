# Djvu

Ruby interface for [DjVuLibre](http://djvu.sourceforge.net/doc/index.html) tools.

## Installation

Install [DjVuLibre](http://djvu.sourceforge.net/index.html) with this oneliner:

```
sudo apt-get update && sudo apt-get install checkinstall && wget http://downloads.sourceforge.net/djvu/djvulibre-3.5.27.tar.gz && tar -xvzf djvulibre-3.5.27.tar.gz && rm djvulibre-3.5.27.tar.gz && cd djvulibre-3.5.27 && sudo ./configure && sudo make && sudo checkinstall && cd ../ && sudo rm -rf djvulibre-3.5.27
```

If you need remove package:

```
sudo dpkg -r djvulibre
```

Add this line to your application's Gemfile:

```ruby
gem 'djvu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install djvu

And require:

```ruby
require 'djvu'
```

## Usage

TODO: Write usage instructions here

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/1v/djvu.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

