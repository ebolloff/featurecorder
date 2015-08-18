# Featurecorder

[![Build Status](https://travis-ci.org/ebolloff/featurecorder.svg?branch=master)](https://travis-ci.org/ebolloff/featurecorder)

This gem was build to translate recorded XML Selenium tests to Cucumber. At the moment it only works with the Ruby On Rails project [Test Ontohub](http://test.ontohub.org) because there some specific things that need to be treated in this project.

## Installation

This gem is not hosted on rubygems.org, so to install it you need to download it and run 

```
bundle
rake install
```

Then you can add it to your Gemfile.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ebolloff/featurecorder.

## Configuration & Usage

If you're reading this, you hopefully want to test the Ruby On Rails project Ontohub on [Test Ontohub](http://test.ontohub.org).
This site is in an similiar status like [Ontohub](http://ontohub.org), but it has a few test data for you to play with. May you want to check on some infos about Selenium and Cucumber before you test our site.

What you need to do first is to install Mozilla Firefox (currently version 39.0), if you haven't yet. After that you need to install the Firefox plugins 'Selenium IDE' (currently version 2.9.0) and 'Selenium XML Formatter' (currently version 1.5.1), which allows you to export the recorded test as XML.

After that you need to change some options in Selenium. Start Selenium and click on Options -> Options. In the opened window you select the tab 'Locator Builders'. These handle the locators to find your selected elements in your tests. With drag & drop you can arrange the locators like this:

- ui
- id
- link
- name
- dom:name
- xpath:link
- xpath:img
- xpath:attributes
- xpath:idRelative
- xpath:href
- dom:index
- xpath:position
- css

Now Selenium will record the elements with the ID, not the css selector because unexcact.

So let's record some tests. Start Selenium, go to test.ontohub.org and click the record button. Everything you interact with the site now will be recorded. With a right click you can add commands like `assertText` or `verifyTitle` so check, if a expected element is present. If you're done just click the record button again and the record will stop. Now you can export the test as XML via File -> Export Test Case As... -> XML Formatter.

The time is now that you need to install this gem. With `featurecorder -h` you can see the options of this gem.

    Usage:
    featurecorder [options] <file>

    Options:
    -s --scenario-name=<scenario>   Name of the scenario.
    -f --feature-name=<feature>     Name of the feature.
    -o --output-directory=<dir>     Output directory for generated files.
                                    Default is current directory.
    -h --help                       Show this screen.

With the option `-s`/`--scenario-name` you can choose the name for the scenario, with `-f`/`--feature-name` the name for the feature. `-o`/`--output-directory` lets you decide where you want to save the generated files for Cucumber. If you call `featurecorder` you need to state the XML file. If you're ready you can post the files in a pull request in our [Ontohub project](https://github.com/ontohub/ontohub/pulls).
