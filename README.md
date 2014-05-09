thoughtbot Podcasts
===================

Application for publishing our podcasts.

Setup
-----

```
git clone git@github.com:thoughtbot/podcasts.git
cd podcasts
./bin/setup
```

Deploy
------

`./bin/setup` will automatically add you as a collaborator, and set up `staging`
and `production` remotes, to the Heroku apps.

### Staging

Deploy to staging:

```
git push staging master
open http://staging.podcasts.thoughtbot.com
```

### Production

Deploy to production

```
git push production master
open http://podcasts.thoughtbot.com
```

Conventions
===========

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

Credits
-------

![thoughtbot](http://thoughtbot.com/logo.png)

This application is maintained and funded by [thoughtbot, inc](http://thoughtbot.com)

Thank you to all [the contributors](https://github.com/thoughtbot/podcasts/contributors)!

The names and logos for thoughtbot are trademarks of thoughtbot, inc.

License
-------

This application is Copyright © 2008-2014 thoughtbot, inc. It is free software,
and may be redistributed under the terms specified in the MIT-LICENSE file.
