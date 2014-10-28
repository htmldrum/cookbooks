# elasticsearch-installer-cookbook

Deploy cookbook for the Elasticsearch API

## Supported Platforms

Ubuntu 12.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['elasticsearch-installer']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### elasticsearch-installer::default

Include `elasticsearch-installer` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[elasticsearch-installer::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: James Meldrum (<jmeldrum@mshanken.com>)

## TODO:
- Start procedure
  - rl3
  - install
    - Ubuntu ( 12.04, 64b )
    - Rails (4.1.5)
    - Ruby (2.1.2)
    - Elasticsearch (1.3.2)
    - PG (9.3.4)
    - Gems: bundle install
  - tasks
    - scraper
    - indexers
    - start web server
  - services
    - elasticsearch
    - pg
    - rails (via nginx)
    - sidekiq ( from Gemfile, needs to be started by executing `bundle exec sidekiq --queue elasticsearch` )
