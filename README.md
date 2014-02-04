# KeyVault

KeyVault manages all your secrets so they don't have to live in the repo.

Currently only works with Rails 3+.

## Installation

Add this line to your application's Gemfile:

    gem 'key-vault', require: 'key_vault'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install key-vault

## Usage

Simply put all secrets that shouldn't be checked into your repo into

    config/key_vault.yml

in your rails app. Then use

    KeyVault[:key]

it. For example, with a file that contains

    session_secret: this-is-super-secret

you can use

    AppName::Application.config.secret_token = KeyVault[:session_secret]

to set your session secret token.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
