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

Staging and production remotes are available on Heroku. Add yourself to the
projects [`thoughtbot-podcasts-staging`] and [`thoughtbot-podcasts-production`].

[`thoughtbot-podcasts-staging`]: https://dashboard.heroku.com/orgs/thoughtbot/apps/thoughtbot-podcasts-staging/resources
[`thoughtbot-podcasts-production`]: https://dashboard.heroku.com/orgs/thoughtbot/apps/thoughtbot-podcasts-production/resources

`bin/setup` will automatically set up `staging` and `production` remotes that
point to those Heroku apps.

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
