# Rails Engine
This was a project that was assigned over four days in Week 4 of Module 3 at the Turing School. The original assignment can be found [here.](https://github.com/turingschool/lesson_plans/blob/b81770c004ff6003a14428d30c8f5061fb817d73/ruby_03-professional_rails_applications/rails_engine.md) The goals of this project was to provide an API built in Rails and test an internal API. Additional features are implementation of more custom ActiveRecord queries and calculations. TDD utilized request tests implemented in RSpec.

## Installation
This repository can be cloned down and ran with:
``` bash
git clone https://github.com/notmarkmiranda/rails-engine.git
cd rails-engine
bundle
rake db:drop db:create db:migrate
rake all
```

To run the server: run ```rails s```
The test suite can be run with ```rspec```
