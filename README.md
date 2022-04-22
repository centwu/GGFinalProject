# Gigih-Family-Catering

Generasi GIGIH 2.0 Backend Track Final Project

![alt text](https://github.com/Jokushu/GGFinalProject/blob/main/public/Header%20%23GenerasiGIGIH.png)

## Introduction

This is a point of sale application for restaurants, created in Rails 7

## Project Scope

```
Key functionality includes the ability to:
- Create, Update, Delete Categories, Menus, and Orders. (only available as an Admin)
- Show daily revenue. (only available as an Admin)
- Show the Menu with associated details.
- Show the Order/Order Items - with associated details.
```

## To Get Started

Project Ruby version: `3.0.3`, if your ruby version installed on device is different, try to change versions in `Gemfile` and `.ruby-version files`.
If you don't have ruby installed or don't know version of ruby installed on your device, you can check [this guide](https://www.ruby-lang.org/en/documentation/installation/)

## Setup Rails App

### Clone git repo:

```
git clone [url of repo]
```

### In project folder, install dependencies:

```
bundle install
```

### Execute database creation, migration, and seeding setup:

```
rake db:create
rake db:migrate
rake db:seed
```
For demo, you can use admin user from seeds file:
```
Email: admin@admin.test
Password: 123456
```

### Start the Rails app:

```
rails s
```

You can find your app by pointing your browser to [http://localhost:3000](http://localhost:3000)

### Run test

```
rspec -fd
```

## Relational Schema

![alt text](https://github.com/Jokushu/GGFinalProject/blob/main/public/Gigih-Family-Catering-ERD.png)