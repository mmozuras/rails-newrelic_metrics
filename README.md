# Rails::NewRelicMetrics

Include in your Gemfile:
```ruby
group :development do
  gem 'rails-newrelic_metrics'
end
```

Use from your Rails console:
```ruby
api_key = 'your New Relic API key'
app_id = 'your New Relic application id'

unused_actions = Rails::NewRelicMetrics::UnusedActions.new(api_key, app_id)

unused_actions.for(PostsController)
unused_actions.all
```
