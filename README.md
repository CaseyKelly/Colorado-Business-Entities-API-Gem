# The Colorado Business Entities API Ruby Gem

[![Build Status](https://travis-ci.org/CaseyKelly/Colorado-Business-Entities-API-Gem.svg)](https://travis-ci.org/CaseyKelly/Colorado-Business-Entities-API-Gem)

A Ruby interface to the Colorado Business Entities API. Documentation for the API can be found at https://data.colorado.gov/developers/docs/colorado-business-entities.

## Installation
    gem install colo_biz

## Configuration
  Any queries made with the ColoBiz::DataFetcher module will return an array of businesses. For each business, all the business' attributes are returned in a JSON hash. The attributes of each object can be called by their [field name](https://data.colorado.gov/developers/docs/colorado-business-entities) in snake case.

  For example, the field name principalcity can be called on any business object as:
  ```ruby
   @bizentity.principal_city
  ```
  For the time being, the search_by_entity_name does a soft search but all other search terms must match exactly except for case.

  Our gem covers most of the queries with a method taking a single argument right out of the box, however, you can modify any query method by entering what you want to use as a search term then adding "&" and a clause or field search after it.

  [Socrata](http://dev.socrata.com/docs/queries.html) gives some examples of useful clauses to add. Here are some examples of how to use a couple. If you wanted to find all the businesses in Evergreen, CO you would first use the ColoBiz::DataFetcher.new.search_by_principle_city(city_name) method and pass in "evergreen" as the argument.
  ```ruby
  ColoBiz::DataFetcher.new.search_by_principle_city("evergreen")
  ```

## Number of Responses

  The default number of responses is only 1,000. You can increase the limit returned, up to the max of 50,000, by including "&$limit=50000" at the end of the string you pass in as the argument for the method. Your final method would look like .search_by_principle_city("evergreen&$limit=50000"). This would return all Business entities in evergreen; about 9,000.

  You can also filter the data with [fields](https://data.colorado.gov/developers/docs/colorado-business-entities). An example of this is to modify the above search to only return LLC's by adding "&entitytype=DLLC" to the end of the argument we're passing the query method:
  ```ruby
  ColoBiz::DataFetcher.new.search_by_principle_city("evergreen&$limit=50000&entitytype=FLLC")
  ```
  Notice that you must use either DLLC for "Domestic Limited Liability Company" or FLLC for "Foreign Limited Liability Company".

  If you feel comfortable with the clauses and fields described above you may be more comfortable stringing them together for your own query to use in the .custom_query(query) method. We did not write a pagination method to return more than 50,000 results because it would be stored in memory.

  The entire dataset is about 1.3 million entities which we feel would be unwieldy in active memory as a single array of objects. If you are comfortable using [pagination](http://dev.socrata.com/docs/paging.html), you want more than 500,000 results and your writing to a database, then you can iterate over our custom query method and write to a database.

## Authors
Finnegan Hewitt
+ GitHub: [@FBH037](https://github.com/FBH037)
+ <fbhewitt@gmail.com>

Casey Kelly
+ GitHub: [@CaseyKelly](https://github.com/CaseyKelly)
+ <casey.kelly@colorado.edu>

NOTE: We built this gem recently while in gSchool in Denver. If you have any questions or suggestions about how to make this gem more useful, feel free to email us.
