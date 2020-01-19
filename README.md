# SNCC Wagbag Manager

Manages the collection and visualization of wagbag stations for SNCC members. Backend consists of a dockerized rails framework hosted through a swarm configuration.

### Prerequisites

* Docker Desktop
  * `Engine >= 19.03.5`
  * `Compose >= 1.24.1`

* Twilio account w/ one virtual phone number

### Getting Started

1. Clone the repository:

    ```
    ~$: git clone git@github.com:Syntaf/wagbag.git
    ```

2. Create a new docker volume for persistant database storage

    ```
    ~$ cd wagbag
    ~$ docker volume create postgres_database
    ```

3. Use docker-compose to spin up postgres and rails containers

    ```
    ~$: docker-compose up
    ```

4. Run pending migrations and seed the database

    ```
    ~$: docker-compose exec web entrypoint.sh rake db:migrate
    ~$: docker-compose exec web entrypoint.sh rake db:seed
    ```

5. Visit the app at http://localhost:3001/dashboard

### Working with inbound SMS messages locally

Some additional configuration is needed in order to receive inbound SMS. If you don't need to work with inbound SMS these steps can be skipped, just keep in mind you'll only be able to work with the seeded data. Before following the steps, **ensure you have a Twilio account with an active virtual phone number**

1.  Create three files inside `./dev-secrets`:
    - `twilio_account_sid.txt` containing your twilio account SID
    - `twilio_auth_token.txt` containing your twilio auth token
    - `twilio_phone_number.txt` containing your twilio phone number.

    Example contents of _twilio\_account\_sid.txt_:

    ```
    AD2e13455506d111172dag6d465fdffd36
    ```

2. Spin up the app with `docker-compose up`

3. Visit `http://localhost:4040/status`. Under the _command\_line_ section you should see a _URL_ field, copy this to your clipboard. This URL will be used by twilio to route inbound SMS messages to your local active dev environment

4. Go to https://www.twilio.com/console and navigate to your phone number

### Rails Binaries

To utilize binaries like `rake` and `rails`, use the following commands

```
# Connect a terminal to the web container
~$: docker-compose exec web entrypoint.sh bash

# Connect a rails console to the web container
~$: docker-compose exec web entrypoint.sh rails c
```

### Database Operations

#### Seed

Running `rake db:seed` inside the container will seed the database with development data.

#### Migrate

Running `rake db:migrate` inside of the container will run all pending migrations

#### Reset

Due to rails running inside a composer instance, `rake db:reset` is not available. Instead, inside the container, run:

```
rake db:drop
rake db:create
rake db:migrate
rake db:seed
```
