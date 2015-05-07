# GetFreaky

All around the world there are great conferences on software, programming languages, web development and more. But conferences are expensive! [Confreaks](confreaks.tv) is a website that posts videos from over two hundred conferences. ```get_freaky``` is a ruby gem that aims to provide a simple command-line interface to the confreaks api to make it easier to browse videos from confreaks.tv and download them for offline viewing.

## Installation

Just install locally with rubygems:

    $ gem install get_freaky

## For the Impatient

The command for the executable is the same as the name of the gem: ```get_freaky```. You can get going right out of the box by running the command in your terminal where you'll be shown the current help information. Check out the commands by running them with the --help flag to see examples.

And if you already know what you want, you can start downloading a video right away:

    $ get_freaky download "The Future of Online Learning" railsberry2013

## Usage

Really basic functionality for the time being, plans to add more to make the tool more useful and easier to use.

Here are the commands:

    $ get_freaky conf

    $ get_freaky event

    $ get_freaky download

add the --help flag to get details on usage from the terminal

More detailed documentation (and more functionality!) to come soon...

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
This is my first gem so any suggestions, tips, pull request, etc. are greatly appreciated!

0. Check out the [code of conduct](https://github.com/smcabrera/get_freaky/blob/master/CODE_OF_CONDUCT.md) for contributors (TL;DR [be excellent to each other](http://giphy.com/gifs/POekkUcKs16gg/html5))
1. Fork it ( https://github.com/smcabrera/get_freaky/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
