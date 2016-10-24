# Djvu

Ruby interface for [DjVuLibre](http://djvu.sourceforge.net/doc/index.html) tools.

## Installation

Install [DjVuLibre](http://djvu.sourceforge.net/index.html) with this oneliner:

```bash
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
### [ddjvu](http://djvu.sourceforge.net/doc/man/ddjvu.html)
```ruby
Djvu.file('Alice_in_Wonderland.djvu').ddjvu(format: 'ppm', page: 1, output_file: '1.ppm')
```
Convert `ppm` to any image format with [rmagick](https://github.com/rmagick/rmagick) or [minimagick](https://github.com/minimagick/minimagick):
```ruby
MiniMagick::Image.open('1.ppm').write('1.png')
```
### [djvutxt](http://djvu.sourceforge.net/doc/man/djvutxt.html)
```ruby
Djvu.file('Alice_in_Wonderland.djvu').djvutxt(page: 8, output_file: '1.txt')
```
### [djvudump](http://djvu.sourceforge.net/doc/man/djvudump.html)
```ruby
dump = Djvu.file('Alice_in_Wonderland.djvu').djvudump
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/1v/djvu.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

