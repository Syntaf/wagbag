# SNCC Wagbag Manager

Manages the collection and visualization of wagbag stations for SNCC members. Backend consists of a dockerized rails framework hosted through a swarm configuration.

## Getting Started (Contributing)

### Prerequisites

* Docker Desktop
  * `Engine >= 19.03.5`
  * `Compose >= 1.24.1`

* Twilio account w/ one virtual phone number

### Running locally

1. Clone the repository:

    ```
    ~$: git clone git@github.com:Syntaf/wagbag.git
    ```

2. Create three files inside `./dev-secrets`:
    - `twilio_account_sid.txt` containing your twilio account SID
    - `twilio_auth_token.txt` containing your twilio auth token
    - `twilio_phone_number.txt` containing your twilio phone number.

    Example contents of _twilio\_account\_sid.txt_:

    ```
    AD2e13455506d111172dag6d465fdffd36
    ```

3. Use docker-compose to spin up postgres and rails containers

    ```
    ~$: cd wagbag
    ~$: docker-compose up
    ```

4. Run pending migrations and seed the database

    ```
    ~$: docker-compose exec web entrypoint.sh rake db:migrate
    ~$: docker-compose exec web entrypoint.sh rake db:seed
    ```

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
