# NotFoundCatcher
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'not_found_catcher'
```

And then execute:
```bash
$ bundle
```

Installazione dell'inizializzatore
```bash
bin/rails g not_found_catcher install
```

## Usage
After installing go to /not_found_catcher and you will see the administration panel, it's a simple 
wrapper around the yml file with the configurations.
If an error occur of not_found inside the applicaion, the yml file will be populated.
You can define simple redirects matching exat the value, or you can use regexp to catch more errors and
redirect these to logic redirects:

/category/(.*)  => http://example.com?category=$1

	

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
