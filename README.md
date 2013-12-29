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
