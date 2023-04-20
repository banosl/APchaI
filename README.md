<!-- PROJECT LOGO -->
<div align="center">
  <p align="center">
    
  </p>
</div>  
<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
[![Activity][commit-activity-shield]][commit-activity-url]
[![Commit][last-commit-shield]][last-commit-url]
[![Contributors][contributors-shield]][contributors-url]
[![Code-Size][code-size-shield]][code-size-url]<br>
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/banosl/APchaI">
  <h3 align="center">APchaI</h3>
  </a>
  

</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ul list-style-position="inside">
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#endpoints">Endpoints</a></li>
      </ul>
    </li>
    <li><a href="#developers">Developers</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ul>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

APchaI is a a RESTful API service that manages a postgres database for a front end to consume. The API allows calls for CRUD funcitionality that applies to customers, teas, and subscriptions. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

</br>[![Rails]][Rails-url]
</br>[![Postgres]][Postgres-url]
</br>[![Visual Studio Code]][VSCode-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

* Ruby 3.0.6
* Rails 6.1.7.3

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/banosl/APchaI.git
   ```
2. Install gems
   ```sh
   bundle install
   ```
3. Setup db
   ```js
   rails db:{create,migrate}
   ```
4. Run RSpec tests
    ```sh
    bundle exec rspec
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Schema
<center>

<img width="823" alt="Screen Shot 2023-04-19 at 7 52 09 PM" src="https://user-images.githubusercontent.com/111591731/233237550-8f1da54e-e3ed-4a36-bfa0-fbb4e9dcdb5e.png">


</center>

## Usage

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Endpoints

- GET /customers
  - Response:
    - ```
        {
          data: [
            {
              "type": "customer",
              "id": "1",
              "attributes": {
                "first_name": "name",
                "last_name": "name",
                "email": "name@email",
                "address": "123 1st St",
                "city": "City Name",
                "state": "State Name",
                "zip_code": "12345",
              },
              "relationships": {
                "active": [ 
                    {          
                      "data": {
                        "type": "subscription",
                        "id": "1",
                        "attributes": {
                          "title": "subscription title",
                          "price": "$1.00",
                          "status": "active",
                          "frequency": "Monthly"
                        },
                        "relationships": {
                          "data": {
                            "type": "tea",
                            "id": "1",
                            "attributes": {
                              "title": "tea name",
                              "description": "describing the tea",
                              "temperature": "30.5 F",
                              "brew_time": "5 minutes"
                            }
                          }
                        }
                      }
                    }
                  ],
                "cancelled": [ 
                    {          
                      "data": {
                        "type": "subscription",
                        "id": "1",
                        "attributes": {
                          "title": "subscription title",
                          "price": "$1.00",
                          "status": "active",
                          "frequency": "Monthly"
                        },
                        "relationships": {
                          "data": {
                            "type": "tea",
                            "id": "1",
                            "attributes": {
                              "title": "tea name",
                              "description": "describing the tea",
                              "temperature": "30.5 F",
                              "brew_time": "5 minutes"
                            }
                          }
                        }
                      }
                    }
                  ]
              }
            }
          ]
        }
      ```
- POST /customer
  - Request Body:
    - ```
      {
        "first_name": "name",
        "last_name": "name",
        "email": "name@email",
        "address": "123 1st St",
        "city": "City Name",
        "state": "State Name",
        "zip_code": "12345",
      }
      ```
  - Response:
    - ```
        {
          "data": {
            "type": "customer",
            "id": "1",
            "attributes": {
              "first_name": "name",
              "last_name": "name",
              "email": "name@email",
              "address": "123 1st St",
              "city": "City Name",
              "state": "State Name",
              "zip_code": "12345",
            }
          }
        }
      ```
- GET /customer/:id
  - Response:
    - ```
        {
          data: {
            "type": "customer",
            "id": "1",
            "attributes": {
              "first_name": "name",
              "last_name": "name",
              "email": "name@email",
              "address": "123 1st St",
              "city": "City Name",
              "state": "State Name",
              "zip_code": "12345"
            },
            "relationships": [ 
              {          
                "data": {
                    "type": "subscription",
                    "id": "1",
                    "attributes": {
                      "title": "subscription title",
                      "price": "$1.00",
                      "status": "active",
                      "frequency": "Monthly"
                    },
                    "relationships": {
                      "data": {
                        "type": "tea",
                        "id": "1",
                        "attributes": {
                          "title": "tea name",
                          "description": "describing the tea",
                          "temperature": "30.5 F",
                          "brew_time": "5 minutes"
                        }
                      }
                    }
                  }
                }
              ]
            }
          }
      ```
- (NOT IMPLEMENTED YET) PATCH /customer/:id
  - Request Body:
    - ```
      {
        "first_name": "new name",
        "last_name": "new name",
        "email": "new email",
        "address": "new address",
        "city": "new City Name",
        "state": "new State Name",
        "zip_code": "new zip code",
      }
      ```
  - Response:
    - ```
        {
          "data": {
            "type": "customer",
            "id": "1",
            "attributes": {
              "first_name": "name",
              "last_name": "name",
              "email": "name@email",
              "address": "123 1st St",
              "city": "City Name",
              "state": "State Name",
              "zip_code": "12345",
            }
          }
        }
      ```
- (NOT IMPLEMENTED YET) DELETE /customer/:id
  - Response:
    - ```
        {
          "status": "200 OK"
          "message": "Customer deleted successfully"
          "data": {}
        }
      ```
- (NOT IMPLEMENTED YET) GET /teas
  - Response:
    ```
      {
        "data" [
          {
            "type": "tea",
            "id": "1",
            "attributes": {
              "title": "tea name",
              "description": "describing the tea",
              "temperature": "30.5 F",
              "brew_time": "5 minutes"
            }
          }
        ]
      }
    ```
- POST /tea
  - Request Body:
    - ```
        {
          "title": "tea name",
          "description": "describing the tea",
          "temperature": "30.5 F",
          "brew_time": "5 minutes"
        }
      ```
  - Response:
    ```
      {
        "data" {
          "type": "tea",
          "id": "1",
          "attributes": {
            "title": "tea name",
            "description": "describing the tea",
            "temperature": "30.5 F",
            "brew_time": "5 minutes"
          }
        }
      }
    ```
- (NOT IMPLEMENTED YET) PATCH /tea/:id
  - Request Body:
    - ```
        {
          "title": "new tea name",
          "description": "change in description",
          "temperature": "change in temp",
          "brew_time": "change in brew time"
        }
  - Response:
    ```
      {
        "data" [
          {
            "type": "tea",
            "id": "1",
            "attributes": {
              "title": "tea name",
              "description": "describing the tea",
              "temperature": "30.5 F",
              "brew_time": "5 minutes"
            }
          }
        ]
      }
    ```
- (NOT IMPLEMENTED YET) DELETE /tea/:id
  - Response:
    - ```
        {
          "status": "200 OK"
          "message": "Tea deleted successfully"
          "data": {}
        }
      ```
- POST /customer/:id/subscriptions
  - Request Body:
    - ```
        {
          "title": "subscription title",
          "price": "$1.00",
          "status": "active",
          "frequency": "Monthly"
          "tea_name": "Tea selection"
        }
      ```
  - Response:
    - ```
        {
          "data": {
            "type": "subscription",
            "id": "1",
            "attributes": {
              "title": "subscription title",
              "price": "$1.00",
              "status": "active",
              "frequency": "Monthly"
            },
            "relationships": {
              "data": {
                "type": "tea",
                "id": "1",
                "attributes": {
                  "title": "tea name",
                  "description": "describing the tea",
                  "temperature": "30.5 F",
                  "brew_time": "5 minutes"
                }
              }
            }
          }
        }
      ```
- PATCH /customer/:id/subscriptions/:id
  - Request Body:
    - ```
        {
          "title": "new subscription title",
          "price": "new price",
          "status": "active or cancelled",
          "frequency": "change in frequency"
          "tea_name": "change in tea selection"
        }
      ```
  - Response:
    - ```
        {
          "data": {
            "type": "subscription",
            "id": "1",
            "attributes": {
              "title": "subscription title",
              "price": "$1.00",
              "status": "active",
              "frequency": "Monthly"
            },
            "relationships": {
              "data": {
                "type": "tea",
                "id": "1",
                "attributes": {
                  "title": "tea name",
                  "description": "describing the tea",
                  "temperature": "30.5 F",
                  "brew_time": "5 minutes"
                }
              }
            }
          }
        }
      ```

### Status Codes

| Code    | Status    | Description   |
| :---    | :---      | :---          |
| 200     |    OK     |               |
| 201     | Created   | Record was created successfully |
| 400     | Bad Request | When creating an object and an attribute is missing |
| 404     | Not Found |               |
| 409     | Conflict  | When trying to create a user with an email already in use  |

Root directory: 'http://localhost:3000/api/v1'


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Developer
<center>

  <img src="https://avatars.githubusercontent.com/u/111591731?v=4" alt="Profile" width="80" height="80"><br>
  Leo Banos Garcia<br>
  [![Github]][GithubLeo-url]
  [![LinkedIn]][LinkedInLeo-url]

</center>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Choose an Open Source License](https://choosealicense.com)
* ["The Best README Template" by Github User othneil](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[commit-activity-shield]: https://img.shields.io/github/commit-activity/m/banosl/APchaI?style=for-the-badge
[commit-activity-url]: https://github.com/banosl/APchaI/commits/main
[last-commit-shield]: https://img.shields.io/github/last-commit/banosl/APchaI?style=for-the-badge
[last-commit-url]: https://github.com/banosl/APchaI/commits/main
[contributors-shield]: https://img.shields.io/github/contributors/banosl/APchaI.svg?style=for-the-badge
[contributors-url]: https://github.com/banosl/APchaI/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/banosl/APchaI.svg?style=for-the-badge
[forks-url]: https://github.com/banosl/APchaI/network/members
[stars-shield]: https://img.shields.io/github/stars/banosl/APchaI.svg?style=for-the-badge
[stars-url]: https://github.com/banosl/APchaI/stargazers
[issues-shield]: https://img.shields.io/github/issues/banosl/APchaI.svg?style=for-the-badge
[issues-url]: https://github.com/banosl/APchaI/issues
[code-size-shield]: https://img.shields.io/github/languages/code-size/banosl/APchaI?style=for-the-badge
[code-size-url]: https://github.com/banosl/APchaI/wiki
[watchers-shield]: https://img.shields.io/github/watchers/banosl/APchaI?style=social
[watchers-url]: https://github.com/banosl/APchaI/network/members
[license-shield]: https://img.shields.io/github/license/banosl/APchaI.svg?style=for-the-badge
[license-url]: https://github.com/banosl/APchaI/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[Rails]: https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000?logo=ruby-on-rails&logoColor=white&style=for-the-badge
[Rails-url]: https://rubyonrails.org 
[GitHub Actions]: https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white
[Github-url]: https://docs.github.com/en/actions
[Postgres]: https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[AWS]: https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white
[AWS-url]: https://aws.amazon.com/
[Visual Studio Code]: https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white
[VSCode-url]: https://code.visualstudio.com/
[Github]: https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white
[GithubLeo-url]: https://github.com/banosl
[LinkedIn]: https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white
[LinkedInLeo-url]: https://www.linkedin.com/in/leo-banos-garcia/
