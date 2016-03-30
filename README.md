##  DataShift 

[![Build Status](https://travis-ci.org/autotelik/datashift.svg?branch=split_into_concerns)](https://travis-ci.org/autotelik/datashift)

- API About to change Drastically - Sorry don't have time to do proper deprecation WARNINGS etc

- [Installation](#Installation)
- [Features](#features)
- [Testing](#testing)
- [License](#license)

Import/Export data between Excel/CSV/Paperclip attachments and Rails/Ruby applications

Comprehensive Wiki here : **https://github.com/autotelik/datashift/wiki**

### <a name="Installation">Installation</a>

Add gem 'datashift' to your Gemfile/bundle or use ```gem install```

```ruby
gem 'datashift'
```

Win OLE and MS Excel are NOT required.

To use the Thor command line applications, pull in the tasks.

Create or add to a high level .thor file in your lib/tasks or root directory

    e.g mysite.thor

Edit the file and add the following to pull in the datashift thor commands :

```ruby
    require 'thor'
    require 'datashift'

    DataShift::load_commands
```

To keep the availability to only development mode use

```ruby DataShift::load_commands if(Rails.env.development?) ```

To check the available tasks run

```bundle exec thor list datashift```

To get usage information use thor help <command>, for example

```bundle exec thor help datashift:generate:excel```


Specific tools for Spree E-Commerce now separate gem [datashift_spree](https://github.com/autotelik/datashift_spree "Datashift Spree")


#### <a name="Features">Features</a>

Use CSV or Excel/OpenOffice/LibraOffice etc (.xls) files to Import or Export your database (ActiveRecord) models

Bulk import tools from filesystem, for Paperclip attachments i.e attach images/mp3 etc to models

Supports all association types, in either hash or json formats.

Set default values, substitutions and transformations per column for Imports.

Generate sample templates, with only headers.

Export template and populate with model data.


####  <a name="ImportCLI">Active Record - Import CLI</a>

Please use thor list and thor help <xxx> to get latest command lines, for example

'''bundle exec thor datashift:import:csv --model BlogPost --input BlogPostImport.csv'''

Imports are based on column headings with *Semi-Smart Name Lookup*

  On import, a dictionary of all possible attributes and associations is created for the AR class.
  
  This enables lookup, of a user supplied name (column heading), managing white space, pluralisation etc .

  Example usage, load from a file or spreadsheet where the column names are only
  an approximation of the actual associations, so given 'Product Properties' heading,
  finds real association 'product_properties' to send or call on the AR object


Can import 'belongs_to, 'has_many' and 'has_one' associations, including assignment of multiple objects
via either multiple columns, or via single column containing multiple entries in json/HASH format.

The DSL can also be used to define which fields to lookup associations, and assign values to other fields.

See Wiki for more details on DSL syntax.

Supports inclusion of delegated attributes and normal instance methods as column headings.

The library can be easily extended with Loaders to deal with non trivial cases,
 for example when multiple lookups required to find right association.

Spree loaders are an example, these illustrate over riding processing for specific columns with
complicated lookup requirements. Spree is the prime Open Source e-commerce project for Rails, 
and the specific loaders and tasks support loading Spree Products, and associated data such as Variants,
OptionTypes, Properties and Images.


### <a name="Testing">Testing</a>
    Specs run against a rails sandbox app, so have own Gemfile, so you can specify versions of 
    active record that you want  specs to run against :

    Edit
        ```ruby spec/Gemfile. ```

    Then run :

    ```ruby
    cd spec
    bundle install
    ```

####  Changing Versions

    A sandbox will be generated in spec/sandbox if no such directory exists.

    **N.B Manual Step**
    When changing versions you probably need to **delete this whole directory**  spec/sandbox. Next time you run spree specs it will be auto generated using latest Rails versions

    The database are created in sqlite3 and are stored in spec/fixtures. When switching versions, of say Spree,
     you will probably want to and to clear out old versions and retrigger the migrations

        rm spec/fixtures/*.sqlite

    You will probably also want to remove lock file :

        rm spec/Gemfile.lock

    First time the sandbox is regenerated, alot of tests may fail,perhaps not everything loads correctly during regeneration process.

    Invariably the next run, the specs pass, so a fix is low priority.

#### Run the Tests

    ** N.B You should run the specs from within the specs directory. **
    ```ruby
        bundle exec rspec -c .
    ```

    A datashift **log **will be written within **spec/logs**, which hooks into the standard active record logger

          /log/datashift.log
          spec/logs/datashift_spec.log




## License

Copyright:: (c) Autotelik Media Ltd 2016

Author ::   Tom Statter

Date ::     Dec 2015

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.