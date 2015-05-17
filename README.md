# GetFreaky

All around the world there are great conferences on software, programming languages, web development and more. But conferences are expensive! [Confreaks](confreaks.tv) is a website that posts videos from over two hundred conferences. ```get_freaky``` is a ruby gem that aims to provide a simple command-line interface to the confreaks api to make it easier to browse videos from confreaks.tv and download them for offline viewing.

## Installation

Just install locally with rubygems:

    $ gem install get_freaky

## For the Impatient

You can save time browsing around for videos and just check out what the featured video for today happens to be and download it if it sounds interesting. Just run:

    $ get_freaky featured

You'll get the title and a short description of the current *featured video* and you'll be asked if you'd like to download it. Not an interesting subject to you? Run the command again--the featured video changes each time. (I'm actually not sure how featured is chosen but just anecdotally they seem to be popular videos from more well-known speakers).

Adding the ```--download``` option will download the video automatically without prompting. This can be nice for scripting purposes, like if you wanted to create a cron job to automatically download a conference video evey week.

    $ get_freaky featured --download

## Usage

The command for the executable is the same as the name of the gem: ```get_freaky```. You can get going right out of the box by running the command in your terminal where you'll be shown the current help information. Check out the commands by running them with the --help flag to see examples.

    $ get_freaky

…which is the same as

    $ get_freaky --help

shows you all the currently available commands. It's close at hand and generally more up to date than this readme!

For any of these commands the ```--help``` flag will give you more usage details.

### Browsing Conference Events
confreaks distinguishes from *conferences* and *events*. Conferences are the name of some regularly occurring conference whereas the event is the specific instance of that conference in a particular year. For instance RailsConf is a conference where RailsConf2015 is an event for rails conf.

You can browse all the events for a given conference with the conf command:

    $ get_freaky conf CONF_NAME

And you'll get a list of all the available events for the conference

### Browsing conference videos for a specific event
Browse all the conference videos at a particular event with the ```event``` command:

    $ get_freaky event EVENT_NAME

This will give you a numbered list of all the videos at an event. You'll be prompted to select one of the numbered list for more information (just hit ctrl-c if you're not interested in any of them). When you do, you'll be given more information about that video and be asked if you'd like to download the video

### Downloading a specific conference video

If you already know a video you want for some reason, you can use the ```download``` command and pass in the talk name and the event name to start downloading the video:

    $ get_freaky download "The Future of Online Learning" railsberry2013

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing
This is my first gem so any suggestions, tips, pull request, etc. are greatly appreciated!

0. Check out the [code of conduct](https://github.com/smcabrera/get_freaky/blob/master/CODE_OF_CONDUCT.md) for contributors (TL;DR [be excellent to each other](http://giphy.com/gifs/POekkUcKs16gg/html5))
1. [Fork it](https://github.com/smcabrera/get_freaky/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
