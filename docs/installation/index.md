# Installation

* [Installation](#installation)
* [Dependencies](#dependencies)
* [Installer](#faeinstall)
* [Seeding](#db-seed)
* [Versioning](#version-management)
* [Heroku](#heroku)

---

# Installation

Add the gem to your Gemfile and run `bundle install`

```ruby
gem 'fae-rails'
```
Run the installer

```bash
$ rails g fae:install
```

After the installer completes, visit `/admin` and setup your first user account. That should automatically log you in to your blank Fae instance.

## Dependencies

### Rails

Fae supports Rails >= 4.1.

### Sass and sass-rails

Fae requires `sass >= 3.4` and `sass-rails >= 5`.

If you're using Rails 4.1 you'll need to update the versions in the `Gemfile`:

```ruby
gem 'sass-rails', '~> 5.0.0'
gem 'sass', '~> 3.4.0'
```

and run:

```bash
$ bundle update sass-rails
$ bundle update sass
```

## fae:install

Fae's installer will do the following:

- add Fae's namespace and route to `config/routes.rb`
- add `app/assets/stylesheets/fae.scss` for UI color management and custom CSS
- add `app/assets/javascripts/fae.js` for custom JS
- add `app/controllers/concerns/fae/nav_items.rb` to manage main navigation
- add Fae's initializer: `config/initializers/fae.rb`
- add `config/initializers/judge.rb` for validation config
- copies over migrations from Fae
- runs `rake db:migrate`
- seeds the DB with Fae defaults

## DB Seed

Fae comes with a rake task to seed the DB with defaults:

```bash
rake fae:seed_db RAILS_ENV=<your_env>
```

If you ran the installer, the task will be run automatically. But if you are setting up an established Fae instance locally or deploying to a server, running this will get you setup with some defaults.

## Version management

Fae follows semantic versioning, so you can expect the following format: `major.minor.patch`. Patch versions add bugfixes, minor versions add backwards compilable features and major versions add non-backward compatible features.

## Heroku

Easily deploy Fae to Heroku by following Heroku's [Rails 4](https://devcenter.heroku.com/articles/getting-started-with-rails4) or [Rails 5](https://devcenter.heroku.com/articles/getting-started-with-rails5) install guides. After Rails is successfully configured, [install Fae as usual](#installation).

The Fae roles will need to be seeded in the remote ENV. Using the [Heroku CLI](https://toolbelt.heroku.com/), run the [following](https://devcenter.heroku.com/articles/rake) from your app directory:

```bash
heroku run rake fae:seed_db
```

If this returns a `ActiveRecord::StatementInvalid: PG::UndefinedTable: ERROR:  relation "fae_roles" does not exist` error, make sure your tables exist:

```bash
heroku run rake db:migrate
```

**Assets**

Heroku [does not store assets](https://devcenter.heroku.com/articles/dynos#ephemeral-filesystem). Although this is not officially supported by Fae, it is possible to [https://github.com/wearefine/fae/issues/324#issuecomment-334578748](store assets uploaded to Fae with S3).
