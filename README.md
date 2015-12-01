# Matrext

[![Gem Version](https://badge.fury.io/rb/matrext.svg)](http://badge.fury.io/rb/matrext)

A simple Ruby gem that takes a phrase and writes it back to the screen, one letter a time, as if each character was being "decoded", Matrix-style.

## Usage

```
# default foreground color on background color
$ matrext "hello world"

# red text on green background
$ matrext -c red -b green "hello world"

# white text on blue background, at insane speed
$ matrext -c white -b blue -s insane "hello world this is your computer speaking to you"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelchadwick/matrext.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
