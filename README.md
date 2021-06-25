# PERFORMANCE TRACKING API
> This is the Front-End application for the PERFORMANCE TRACKING system.

## Screen shot
![screenshot](./screenshot.png)

## Live Demo

[API Preformance tracking ON HEROKU](https://gentle-shore-76199.herokuapp.com/)#

# Built With

- Ruby on Rails
- Devise
- JWT
- Postgress


# API USER GUIDE

## To install it locally

Clone  this repository or download the zip version to your local disk and extract it.

Run the command

``` bundle ```

Then you must create the database with:

``` rails db:create ```

following you should run the migrations to create the tables.

``` rails db:migrate ```

At the end you should run the following command to run the API service.

``` rails server ```

After the service is up, you could create your own aplication front end, or use 
the one provider in the repository: "https://github.com/carlosprietobarron/perform-ui"

## User creation and login endpoints

To create user you can use the endpoint: POST :  https://gentle-shore-76199.herokuapp.com/users 

using the following json data :
```
data = {
      name: username,
      email: email,
      password: password,
      password_confirmation: passwordConfirmation
    }
```

The call shall be made as the following example using axios:  

post(`https://gentle-shore-76199.herokuapp.com/users`, data)

If the request is successful it will respond with a json formmated resposen like the following:

```
{
    "user": {
        "id": 4,
        "name": "testuser",
        "email": "testuser@performapi.edu",
        "password_digest": "$2a$12$N9RSyO1b9u0SE45q8xvAAe806WZZA5Km2GkMZ6atDPS6YhX/MSbfW",
        "role": null,
        "created_at": "2021-06-07T17:12:46.781Z",
        "updated_at": "2021-06-07T17:12:46.781Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2MjU2Nzc5NjZ9.7BxNxLGrEwNGSU8u5pUZisT9mW6d5Hzr3uS_SqalSBo",
    "status": 201,
    "message": "Log in successful"
}
```

Which incliude the status and the created token for the user session.

## Login control

To Login the user to the API app you can use the following request:  

post(`https://gentle-shore-76199.herokuapp.com/login`, data)

using the following json data :

```
data = {
      name: username,
      password: password,
      }
```

If the request is successful it will respond with a json formmated resposen like the following:

```
{
    "user": {
        "id": 4,
        "name": "testuser",
        "email": "testuser@performapi.edu",
        "password_digest": "$2a$12$N9RSyO1b9u0SE45q8xvAAe806WZZA5Km2GkMZ6atDPS6YhX/MSbfW",
        "role": null,
        "created_at": "2021-06-07T17:12:46.781Z",
        "updated_at": "2021-06-07T17:12:46.781Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2MjU2NzgyOTZ9.H8ngm_52Mht3sQkY59dfWXHMORPn3Yr02YeObSU-cNw",
    "status": "created"
}
```

Which include the status and the created token for the user newlly created session.



## Create new Indicators

Each person has it's own goals and objectives and the performance indicator best for him, thus you must be able
to create your own success metrics and indicators.  The way to do this is using the next endpoint:

POST(`http://hosturl//indicators`, data, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
    })

with the following data body:

```
{
    "name": "demo indicator",
    "goal": "5",
    "description": "this ia a demo indicator"
}
```


If Succeed The API will send the following response to the given request:

```
{
    "loggedIn": true,
    "result": {
        "id": 11,
        "name": "demo indicator",
        "goal": 5,
        "created_at": "2021-06-07T23:41:33.966Z",
        "updated_at": "2021-06-07T23:41:33.966Z",
        "image": "https://i.ibb.co/2vgCGV5/uconstruction.jpg",
        "description": "this ia a demo indicator"
    },
    "message": "Successfully created Indicator",
    "status": "created"
}
```

## Create a masure for an indicator.

This measure represents the number of times a certain indicator (or task) occurs in a given day.

To create a new measure the API endpoint is the next:

POST `http://hosturl/indicators/${indicator id}/measures`, data, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
    }

where the data object is defined as follows:

```
 {
    "day": "03-06-2021",
    "measure": "15",
    "comentary": "Testing with may"
}
```

And the response would be:

```
{
    "id": 18,
    "measure": 15,
    "day": "2021-06-03",
    "comentary": "Testing with may",
    "indicator": {
        "id": 1,
        "name": "Cold Calls",
        "description": null,
        "goal": 20,
        "image": null,
    }
}
```

## Retrieve the Indicators along with a year of measure to create chart

To retrieve the indicators with the data of measures in order to create charts you can use

GET : `http://localhost:3000/indicators`, {
    headers: {
      'Content-Type': `application/json`,
      Authorization: `Bearer ${token}`,
    }

that will return the following data:

```
{
    "loggedIn": true,
    "result": [
        {
            "id": 1,
            "name": "Cold Calls",
            "goal": 20,
            "image": null,
            "description": null,
            "measures": [
                {
                    "measure": 15,
                    "day": "2021-05-03",
                    "comentary": "Testing with may"
                },
                {
                    "measure": 12,
                    "day": "2021-05-04",
                    "comentary": "12 notas this day"
                },
                {
                    "measure": 25,
                    "day": "2021-05-26",
                    "comentary": "day1"
                },
                {
                    "measure": 34,
                    "day": "2021-05-25",
                    "comentary": "dia 2"
                },
                {
                    "measure": 23,
                    "day": "2021-05-31",
                    "comentary": "notes"
                },

            ]
        },
        {
            "id": 2,
            "name": "Registered Apointments",
            "goal": 10,
            "image": null,
            "description": null,
            "measures": [
                {
                    "measure": 20,
                    "day": "2021-05-03",
                    "comentary": "no hay"
                },
                {
                    "measure": 25,
                    "day": "2021-05-03",
                    "comentary": "notaas"
                },
            ]
        },
    }    
}
```


## Author

👤 Carlos Prieto Barron

- Gitshub: [@carlosprietobarron](https://github.com/carlosprietobarron)
Linkedin: [Carlos Prieto Barrón](https://www.linkedin.com/in/carlosprietobarron/)
## 🤝 Contributing


Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](lic.url) licensed.
