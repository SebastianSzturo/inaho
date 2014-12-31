## Inaho :ear_of_rice:   
[![Build Status](https://travis-ci.org/SebastianSzturo/inaho.svg?branch=master)](https://travis-ci.org/SebastianSzturo/Inaho) [![Code Climate](https://codeclimate.com/github/SebastianSzturo/Inaho/badges/gpa.svg)](https://codeclimate.com/github/SebastianSzturo/Inaho)

A gem to easily build XML Files to create Dictionaries for Apple's Dictionary.app.

## Requirements
-  Ruby >= 2.0
-  [Dictionary Development Kit](https://github.com/SebastianSzturo/dictionary-development-kit)

## Installation

Add this to your gemfile

```ruby
  gem 'inaho'
```

and

```
  bundle
```

## Usage

Create a Dictionary.

```ruby
dictionary = Inaho::Dictionary.new
```

Add Entries to your Dictionary.

```ruby
entry = Inaho::Entry.new(id: 1, title: "稲穂", yomi: "いなほ")
entry.add_index("稲穂")
entry.add_index("いなほ")
entry.add_index("inaho")
entry.add_index("ear (head) of rice")
entry.body = "<h3>稲穂 (いなほ)</h3> <ul><li>ear (head) of rice</li></ul>"

dictionary << entry
```

Build your Dictionary XML File

```ruby
xml = dictionary.to_xml
File.write('./dictionary.xml', xml)
```
Create your Dictionary with Apple's [Dictionary Development Kit](https://github.com/SebastianSzturo/dictionary-development-kit).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
