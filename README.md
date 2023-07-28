# Readme

![IssueTicketsApp.png](issueticketapp.png)

This is a simple application that allows your clients to submit tickets to the repository without having a Github account.

* Ruby on Rails 7
* Hotwire with TurboStreams
* Stimulus.js
* TailwindCSS
* Github API

## Installation

1. Clone or fork the repository
2. Adjust deployment settings as needed
3. Configure storage (prefer to use AWS S3 Bucket or any similar service)
4. Setup ENVs (see below)
5. Deploy, run migrations and seeds
6. Generate user from console (User arent'registrable)
7. Update project settings (see below)
8. Share account credentials with your clients

## ENVs

Here is an example of `.env` file:

```dotenv
DATABASE_URL=localhost
DATABASE_NAME=issueticketsapp
DATABASE_USER=db_user
DATABASE_PASSWORD=db_password
DATABASE_URL=postgresql://db_user:db_password@localhost/issueticketsapp
APP_URL=http://lvh.me
APP_NAME=Issue Tickets App
HOST=lvh.me
PORT=3000
PROTOCOL=http
NO_REPLY_EMAIL="no-reply@issuetickets.app"
SECRET_KEY_BASE=super_secret_key
REDIS_URL="redis://localhost:6379"
SIDEKIQ_USERNAME="admin"
SIDEKIQ_PASSWORD="admin"
GITHUB_ACCESS_TOKEN=get_your_token_in_github
S3_BUCKET_ENDPOINT="https://nyc3.digitaloceanspaces.com"
S3_BUCKET_URL="https://bucket_name.region.digitaloceanspaces.com"
S3_ACCESS_KEY=s3_api_access_key
S3_SECRET_KEY=s3_sectet_key
S3_BUCKET_NAME="your_bucket_name"
S3_BUCKET_REGION="region"
RAILS_SERVE_STATIC_FILES=enabled
RAILS_MAX_THREADS=6
RAILS_MIN_THREADS=1
```

## Admin

Actually, the application must configured manually.
To get everything working you will need to create manually a user and a project.

Create admin user from console:

```ruby
admin = User.create(email: "", password: "", password_confirmation: "", admin: true)
```



### Project

Once you have a user, create a new project and assign it to the user.
Then you will need to update the project settings with Github repository URL and Github API key:

You can do it from the console:

```ruby
class Project < ApplicationRecord {
                 :id => :integer,
               :name => :string,
    :github_repo_url => :string,
     :github_api_key => :string,
            :user_id => :integer,
         :created_at => :datetime,
         :updated_at => :datetime
}
```

Or logging as admin and updating the project settings from the URL (`http://lvh.me:3000/admin/projects/`)
As admin you can create projects.

## Users

Last step is to create a user for each project.
You can do it from the console:

```ruby
# admin is false by default
user = User.create(email: "", password: "", password_confirmation: "")

# Create as many user as you want.
```

## Versioning

### 0.1.0

* Initial release
* SPA for submitting tickets as issues to the Github repository
* User authentication
* Project settings for each user
* 90% of Internalization
* Markdown support
* Attachments support
* Github API integration
* Github issues integration
* Github issue default labels support
