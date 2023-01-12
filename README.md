
## Installation
- Install bundler: `gem install bundler`
- Install gems: `bundle install`
- Install nodejs packages: `yarn install`
- Config database: create `config/database.yml` file (see example file at `config/database.yml.example`)
- Add env: create `.env` file (see example file at `.env.example`)
- Add rails master key at `config/master.key` or generate new one by `rm -rf config/credentials.yml.enc && rm -rf config/master.key && EDITOR=vim rails credentials:edit`
- Database setup: `bundle exec rake db:setup`
- Start server: `rails s`
- Start webpack server: `./bin/webpack-dev-server`
- Visit `http://localhost:3000` and start your development

## Rspec

- Run test by `bundle exec rspec`
- Check test coverage at `coverage/index.html`

## ESLint

- ESLint check: `yarn lint`
- ESLint check & auto fix: `yarn lint:fix`
