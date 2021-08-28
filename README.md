# Blog

Intro:
[BloggerHeroku](https://bloggerat.herokuapp.com/)

---

## Focus

- Back-end: Database associations, MVC, Well tested application
- Front-end: Using bootstrap to make a good looking website.

## Approach

- Ensuring the fundamentals are done correctly.
- Clean code
- Well tested code
- Write the program from scratch and not rely on ruby magic / generators in order to get a good understanding of how rails work.

---

## Learnings

- Validation with models.

- Creating controllers without using generate method.

- Enable log in/sign up without using gems such as devise.

- REST - Representational state transfer: Mapping HTTP verbs to CRUD actions. HTTP verbs are get,post,put/patch and destory.

- Understanding of MVC due to rails strict layout.

## Problems faced:

- Whilst implementing the delete method for the article method i came across an unusual error which seemed to be coming from webpacker and the javascript tag within the layout/application.html.erb file. The error was that every time i would try to delete an article it would just show the article and was not understanding that i wanted a delete request. It Seemed like a deep rooted issue so i decided to create a new rails project and copy my code over... it started to work the way i intended it too. At this point on my previous repo i was 13 commits in.

![Previous commits](https://user-images.githubusercontent.com/37899538/112188037-8c7cb500-8bfa-11eb-875a-1efbe8657b60.png)

- Deploying to heroku was an issue for me. My ruby version in the gemfile did not work with heroku 20 so i had to change the version to 2.6.6 and then the bunlder needed updating. Once this was done, i used a ENV variable in the database.yml file for production and ran 'heroku run rails db:migrate" and the app was finally deployed to heroku.

- I cloned the repo into a new enviroment and was not able to run local host, i was getting an error that said i had to require bootstrap. When i looked into these errors and fixed them i got further errors about webpack and its manifest. To resolve all the errors i need to run yarn if i clone the repo into a new enviroment.

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Deployment instructions
