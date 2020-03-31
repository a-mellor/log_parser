# Log parser

A simple log parser

## Usage

```sh
bundle install

bundle rspec # run the tests

ruby parser.rb webserver.log # output data from websever.log
```

## Approach

The `DataAnalyser` is the public facing class that is responsible for taking the log file and returning data. 
The responsibility of parsing the log and formatting it was passed to the `LogParser` and 
`Formatter` respectively.

## Testing and coverage

Unit testing is done using [RSpec](https://rspec.info/) and test coverage is handled by 
[SimpleCov](https://github.com/colszowka/simplecov). Test coverage is 100% and can be viewed
[here](coverage/index.html).

## Style

[RuboCop](https://github.com/rubocop-hq/rubocop) was used for linting.

## TODO

* Add integration test
* `LogParser` expects a certain format of input and is therefor not very extendable. 
* `LogParser` splits the data based on an assumed format. We should validate that the line is in the expected format,`/page 123.123.123.123`, and stop processing if a line is not as expected.
* Add additional file formats that the `DataAnalyser` accepts. 

