# README

### Step to run application
- Default ruby 2.6.1, for change ruby version change in Gemfile
- Run `bundle install`
- Run `rails db:create & rails db:migrate`
- Run `rails db:seed` to generate projects
- Run `rails s`

### APIs

Projects

GET /api/projects

Response:
[
  {
      "id": 1,
      "name": "Gorgeous Iron Plate",
      "technology": "ror"
  },
  {
      "id": 2,
      "name": "Intelligent Wool Shoes",
      "technology": "python"
  },
  ....
}

--------------------------------------------

Users

POST /api/users

Body:
{
  user: {
    first_name: 'anshu',
    last_name: 'kumar',
    email: 'test@mailinator.com',
    contact: '123123123',
    skills: '[js, python]',
    project_id: 1
  }
}

Response:

{
    "id": 1,
    "full_name": "anshu2 kumar2",
    "email": "test@mailinator.com",
    "contact": "1231231",
    "current_project": [],
    "skills": "js, python",
    "end_date": []
}

--------------------------------------------

PATCH /api/update

Body:
{
  user: {
    first_name: 'anshu',
    last_name: 'kumar',
    email: 'test@mailinator.com',
    contact: '123123123',
    skills: '[js, python, ror]',
    project_id: 1
  }
}

Response:

{
    "id": 1,
    "full_name": "anshu2 kumar2",
    "email": "test@mailinator.com",
    "contact": "1231231",
    "current_project": [],
    "skills": "js, python, ror",
    "end_date": []
}

--------------------------------------------

DELETE /api/users/1

Response:
{
    "message": "Deletion of user anshu2 kumar2 is successful"
}

--------------------------------------------

GET /api/assign_project/2/2?end_date=12/12/2019

Response:

{
    "id": 2,
    "full_name": "anshu2 kumar2",
    "email": "test@mailinator.com",
    "contact": "1231231",
    "current_project": [
        "Intelligent Wool Shoes"
    ],
    "skills": "js, python",
    "end_date": [
        "2019-12-12T00:00:00.000Z"
    ]
}

--------------------------------------------

GET /api/team

Response:

{
    "users": [
        {
            "id": 2,
            "first_name": "anshu2",
            "last_name": "kumar2",
            "email": "test@mailinator.com",
            "contact": "1231231",
            "skills": "js, python",
            "created_at": "2019-03-13T08:42:41.050Z",
            "updated_at": "2019-03-13T08:42:41.050Z"
        }
    ],
    "has_previous": false,
    "has_next": false,
    "page": 1
}

--------------------------------------------

GET /api/team?skill=[js,python]

Response:

{
    "users": [
        {
            "id": 2,
            "first_name": "anshu2",
            "last_name": "kumar2",
            "email": "test@mailinator.com",
            "contact": "1231231",
            "skills": "js, python",
            "created_at": "2019-03-13T08:42:41.050Z",
            "updated_at": "2019-03-13T08:42:41.050Z"
        }
    ],
    "has_previous": false,
    "has_next": false,
    "page": 1
}

--------------------------------------------

GET /api/team?project=2

Response:

{
    "users": [
        {
            "id": 2,
            "first_name": "anshu2",
            "last_name": "kumar2",
            "email": "test@mailinator.com",
            "contact": "1231231",
            "skills": "js, python",
            "created_at": "2019-03-13T08:42:41.050Z",
            "updated_at": "2019-03-13T08:42:41.050Z"
        }
    ],
    "has_previous": false,
    "has_next": false,
    "page": 1
}

--------------------------------------------

GET /api/team?holidays=true

Response:

{
    "users": [
        {
            "id": 2,
            "first_name": "anshu2",
            "last_name": "kumar2",
            "email": "test@mailinator.com",
            "contact": "1231231",
            "skills": "js, python",
            "created_at": "2019-03-13T08:42:41.050Z",
            "updated_at": "2019-03-13T08:42:41.050Z"
        }
    ],
    "has_previous": false,
    "has_next": false,
    "page": 1
}

--------------------------------------------

GET /api/team?working=true

Response:

{
    "users": [
        {
            "id": 2,
            "first_name": "anshu2",
            "last_name": "kumar2",
            "email": "test@mailinator.com",
            "contact": "1231231",
            "skills": "js, python",
            "created_at": "2019-03-13T08:42:41.050Z",
            "updated_at": "2019-03-13T08:42:41.050Z"
        }
    ],
    "has_previous": false,
    "has_next": false,
    "page": 1
}

--------------------------------------------

Holidays

POST api/holidays

Body:
{
  holiday: {
    start_at: '13/03/2019',
    end_at: '20/03/2019'
    user_id: 1
  }
}

Response: {
    "id": 1,
    "user_name": "anshu2 kumar2",
    "start_at": "2019-03-13T00:00:00.000Z",
    "end_at": "2019-03-20T00:00:00.000Z"
  }

--------------------------------------------

GET api/holidays

Response: [
    {
        "id": 1,
        "user_name": "anshu2 kumar2",
        "start_at": "2019-03-13T00:00:00.000Z",
        "end_at": "2019-03-20T00:00:00.000Z"
    }
]

----------------------------------------------
