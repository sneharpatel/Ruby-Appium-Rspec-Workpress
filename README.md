## Ruby-RSpec-Appium-Android

This code is provided on an "AS-IS” basis without warranty of any kind, either express or implied, including without limitation any implied warranties of condition, uninterrupted use, merchantability, fitness for a particular purpose, or non-infringement. This code may be used for educational purpose. 
### Environment Setup

1. Global Dependencies
    * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
    * Or Install Ruby with [Homebrew](http://brew.sh/)
    ```
    $ brew install ruby
    ```
    * Install [Rake](http://docs.seattlerb.org/rake/)
    ```
    $ gem install rake
    ```
    * Install bundler (Sudo may be necessary)
    ```
    $ gem install bundler
    ```
    * Install [Appium](http://appium.io/)
    * Install [Virtualbox](https://www.virtualbox.org/) + [Genemotion](https://www.genymotion.com/) for Android simulator

2. Wordpress Credentials
    * In the terminal export your Credentials and other environmental variables:
    ```
    $ export wordpress_user_email=<your wordpress username>
	$ export wordpress_password=<your wordpress password>
	$ export wordpress_app_location=<either APK or IPA file location>
    ```
3. Project Dependencies
	* Install packages (Use sudo if necessary)
	```
	$ bundle install
	```
### Running Tests
    ```
    $ rspec
    ```

