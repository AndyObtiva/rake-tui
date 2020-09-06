# rake-tui
[![Gem Version](https://badge.fury.io/rb/rake-tui.svg)](https://badge.fury.io/rb/rake-tui)

[Rake](https://github.com/ruby/rake) Text-Based User Interface

![Rake TUI Demo](rake-tui-demo.gif)

## Pre-requisites

- [Ruby](https://www.ruby-lang.org/en/)

## Setup Instructions

### Vanilla Ruby

```
gem install rake-tui
```

### Bundler

```ruby
gem 'rake-tui'
```

### [RVM](https://rvm.io/)

```
rvm @global do gem install rake-tui
```

## Usage

Simply run this command:

```
rake-tui
```

### [JRuby](https://www.jruby.org/)

If you are using [RVM](https://rvm.io/), then `rake-tui` works in [JRuby](https://www.jruby.org/) too.

Otherwise, simply run this command instead:

```
jrake-tui
```

## TODO

- Passing arguments to rake tasks that expect them
- Windows compatibility
- Fuzzy search filtering
- Fill terminal window with more text when expanded from a smaller size that truncates rake task descriptions 

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
