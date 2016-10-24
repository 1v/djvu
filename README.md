# Djvu

[![Gem Version](https://badge.fury.io/rb/djvu.svg)](https://rubygems.org/gems/djvu)
[![Build Status](https://travis-ci.org/1v/djvu.svg?branch=master)](https://travis-ci.org/1v/djvu)
[![Code Climate](https://codeclimate.com/github/1v/djvu/badges/gpa.svg)](https://codeclimate.com/github/1v/djvu)
[![Test Coverage](https://codeclimate.com/github/1v/djvu/badges/coverage.svg)](https://codeclimate.com/github/1v/djvu/coverage)

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
# Extract text layer from page to txt file
Djvu.file('Alice_in_Wonderland.djvu').djvutxt(page: 8, output_file: '1.txt')
# Extract text layer from page to variable
text = Djvu.file('Alice_in_Wonderland.djvu').djvutxt(page: 8)
```
### [djvudump](http://djvu.sourceforge.net/doc/man/djvudump.html)
```ruby
dump = Djvu.file('Alice_in_Wonderland.djvu').djvudump
```
### [djvused](http://djvu.sourceforge.net/doc/man/djvused.html)
```ruby
# Getting number of pages in djvu file
num = Djvu.file('Alice_in_Wonderland.djvu').djvused(e: 'n')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/1v/djvu.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

