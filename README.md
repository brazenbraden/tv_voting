# README

Files of importance:
- app/libs/parser.rb
- app/libs/vote_parser.rb
- app/mappers/relational.rb

Lets start with the `Parser` class, the entry point into loading data into the system. To run it, simply type
```ruby
rails runner app/libs/parser.rb votes.txt
``````
It can also be run from the rails console with
```ruby
Parser.new("votes.txt").call
```
The reason I have created a libs folder inside of app is that that the we get the benefit of auto-loading. "libs" might not be the best name but that is a matter of convention / preference. I could have added the lib directory to the autoload path instead however that is generally not recommended.

The class accepts one argument for the voting log filename, which its checks exists before attempting to do any processing. We then clean and pass each line of the log file into our `VoteParser` class which returns back a data object with the key data extracted and formatted for easy consumption. That data takes the form of:


```ruby
{
  campaign_name: {
    contenstant_name: {
      votes: 0,
      uncounted: 0
    }
  }
}
```
This data output is then fed into our `Relational` class which is responsible for using that data to populate the database.

I chose not to out the `VoteParser` logic inline with the main `Parser` class in order to keep the option open for different parsers to be used. I assume for now that the `VoteParser` is the only one going to be needed so have referenced it explicitely in the initializer however in future, should an alternative parser be required, this could be modified to take the parser in the initializer arguments (similar to how I'm passing in the `Relational` class to the call method.)

On the same token, I created the `Relational` class in order to demonstrate that we may potentially wish to consume this data in another way and we can therefore simply inject the class we want to use into the `call` method. As long as the mappers maintain the same DSL, it would all just work. For instance, using a database for storage while running tests is inherently expensive and slow, we might opt to instead, use some form of MemoryStore. Or perhaps we wish to produce a CSV from the data. Nothing in this class would have to change, only the injected data_mapper class.

Even though there isnt an explicit spec for the `Relational` class, it is tested via the `parser_spec`. Given more time, I would have added a spec specifically for it.. who knows, maybe someone deletes this Parser and its spec but the Relational class goes on living ;)

I didn't spend much time on the styling of the actual website as the focus of this task was on the business logic, however I did add some styling (both inline and via CSS) to demonstrate that I know what this is.
