# rake-tui
[![Gem Version](https://badge.fury.io/rb/rake-tui.svg)](https://badge.fury.io/rb/rake-tui)

[Rake](https://github.com/ruby/rake) Text-Based User Interface

![Rake TUI Demo](rake-tui-demo.gif)

Other TUI gems you may be interested in:
- [rvm-tui](https://github.com/AndyObtiva/rvm-tui)

## Pre-requisites

- [Ruby](https://www.ruby-lang.org/en/)

## Setup Instructions

### Vanilla Ruby

```
gem install rake-tui
```

### Bundler

```ruby
gem 'rake-tui', require: false
```

### [RVM](https://rvm.io/)

```
rvm @global do gem install rake-tui
```

## Usage

Simply run this command:

```
rakeui
```

Or one of the aliases:

```
rake-ui
raketui
rake-tui
```

### [JRuby](https://www.jruby.org/)

If you are using [RVM](https://rvm.io/), then `rake-tui` works in [JRuby](https://www.jruby.org/) too.

Otherwise, simply run this command instead:

```
jrakeui
```

Or one of the aliases:

```
jrake-ui
jraketui
jrake-tui
```

## API

To use [rake-tui](https://rubygems.org/gems/rake-tui) as part of a Ruby app, require the [rake-tui](https://rubygems.org/gems/rake-tui) gem once at the top of your code:

```ruby
require 'rake-tui'
```

Afterwards, simply invoke the `Rake::TUI.run` method wherever you need to display the TUI to the user:

```ruby
Rake::TUI.run
```

If you'd rather specify or limit the tasks shown, then pass the tasks to the constructor before running:

```ruby
Rake::TUI.new(tasks).run
```

If you want to make that the default, then set the singleton instance:

```ruby
Rake::TUI.instance(Rake::TUI.new(tasks))
Rake::TUI.run # this now displays the specified task list
```

## TODO

[TODO.md](TODO.md)

## Change Log

[CHANGELOG.md](CHANGELOG.md)

## Contributing to rake-tui

-   Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
-   Check out the issue tracker to make sure someone already hasn't
    requested it and/or contributed it.
-   Fork the project.
-   Start a feature/bugfix branch.
-   Commit and push until you are happy with your contribution.
-   Make sure to add tests for it. This is important so I don't break it
    in a future version unintentionally.
-   Please try not to mess with the Rakefile, version, or history. If
    you want to have your own version, or is otherwise necessary, that
    is fine, but please isolate to its own commit so I can cherry-pick
    around it.

## Copyright

[MIT](LICENSE.txt)

Copyright (c) 2020 Andy Maleh.
