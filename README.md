# Streaming Relational Database

Streaming Relation Database is a sample Rails 5.0.x app which can be used to receive Meltwater API search results (editorial) and stored to database. The selected database used in this sample project is [Microsoft SQL Server][mssql-server-official].

## Getting Started

1. Run `docker-compose`:

        $ docker-compose up

2. Open [http://localhost:3000][rails-local] in your browser. This should greet you with the default Rails welcome page.

3. Run a sample POST request with the provided [sample/sample-payload.json][sample-payload]:

        $ curl -XPOST http://localhost:3000/webhooks -H 'Content-Type: application/json' -d @./sample/sample-payload.json

You should now have a new (editorial) search result in your database. To inspect your data, use an appropriate Microsoft SQL Server client, e.g. [sqlcmd][sqlcmd].

### On initial startup

The very first time you start `docker-compose up` the Rails app might exit after a short time. The reason is that you will need to first run the database creation and migration tasks:

1. On initial run:

        $ docker-compose up

Rails app will exit on first time. Simply press CTRL-C to stop docker-compose.

2. Run migration tasks:

        $ docker-compose run web rake db:create
        $ docker-compose run web rake db:migrate


3. Re-run `docker-compose`:

        $ docker-compose up

Now you should be able to open [http://localhost:3000][rails-local].

## Appendix

This repository is using [Microsoft's SQL Server as Linux docker container][mssql-server-linux-docker]. More information can be found [here][mssql-server-linux-docker].

[mssql-server-official]: https://www.microsoft.com/en-us/sql-server/
[sqlcmd]: https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-connect-and-query-sqlcmd
[mssql-server-linux-docker]: https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-docker
[sample-payload]: ./sample/sample-payload.json
[rails-local]: http://localhost:3000
