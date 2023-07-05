# dbt-project
Project to setup DBT and define different models



## Profiles

Add the following to `~/.dbt/profiles.yml`:

```yaml
mario3:
  outputs:

    dev:
      type: postgres
      threads: 1
      host: localhost
      port: 5432
      user: jitsejan
      pass: MyP0stgr3sPassw0rd
      dbname: postgres
      schema: mario3

    prod:
      type: postgres
      threads: 1
      host: localhost
      port: 5432
      user: jitsejan
      pass: MyP0stgr3sPassw0rd
      dbname: postgres
      schema: mario3

  target: dev
```