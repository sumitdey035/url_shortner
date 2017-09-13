# URL Shortner

The application should be able to put a URL into the home page and get back a urlof
the shortest possiblelength.

* Ruby and Rails version
    * Ruby version: 2.2.3
    * Rails version: 4.2.7

* Setting up development
    * Clone the project from github
        ````
        git clone https://github.com/sumitdey035/url_shortner.git
        ````
    * Go to the project folder
        ````
        cd url_shortner
        ````
    * Run bundler
        ````
        bundle install
        ````
    * Setup database
        ````
        rake db:setup
        ````
        
* Running development env:
    * Start rails server
        ````
        rails s
        ````
* Run specs
    ````
    rake db:setup RAILS_ENV=test
    bin/rspec spec
    ````