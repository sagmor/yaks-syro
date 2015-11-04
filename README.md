# Yaks::Syro

[![Gem](https://img.shields.io/gem/v/yaks-syro.svg)](https://rubygems.org/gems/yaks-syro)
[![Build Status](https://travis-ci.org/sagmor/yaks-syro.svg)](https://travis-ci.org/sagmor/yaks-syro)
[![Test Coverage](https://codeclimate.com/github/sagmor/yaks-syro/badges/coverage.svg)](https://codeclimate.com/github/sagmor/yaks-syro/coverage)
[![Code Climate](https://codeclimate.com/github/sagmor/yaks-syro/badges/gpa.svg)](https://codeclimate.com/github/sagmor/yaks-syro)
[![Inline docs](http://inch-ci.org/github/sagmor/yaks-syro.svg?branch=master)](http://inch-ci.org/github/sagmor/yaks-syro)


[Syro](http://soveran.github.io/syro/) integration for [Yaks](https://github.com/plexus/yaks).

## Usage

Add this line to your application's Gemfile:

```ruby
gem 'yaks-syro'
```

Configure your app:

```ruby
class MyApp < Syro::Deck
  include Jaks::Syro

  configure_yaks do
    # Configure Yaks here
  end
end

app = Syro.new(MyApp) {
  on('posts') {
    get {
      # Render your yaks mappers
      yaks PostsRepository.all
    }
  }
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sagmor/yaks-syro. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

