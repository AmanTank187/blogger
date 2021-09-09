# Blog

Intro:
[BloggerHeroku](https://bloggerat.herokuapp.com/)

---

![Screenshot 2021-08-31 at 16 11 12](https://user-images.githubusercontent.com/37899538/131529519-177b4492-27fd-401a-adc6-23ffcedc9624.png)

![Screenshot 2021-08-31 at 16 11 48](https://user-images.githubusercontent.com/37899538/131529580-366ccc80-49ff-4fef-8372-6e13549f791b.png)

![Screenshot 2021-08-31 at 16 15 05](https://user-images.githubusercontent.com/37899538/131529620-f80b7b82-256c-4f16-bf22-42f62acbbe5a.png)

---

## Focus

- Back-end: Database associations, MVC, Well tested application.
- Front-end: Using bootstrap to make a good looking website.
- Getting comfortable with rails. 

## Approach

- Ensuring the fundamentals are done correctly.
- Clean code
- Well tested code
- Write the program from scratch and not rely on ruby magic / generators in order to get a good understanding of how rails work.

---

## Learnings

- Validation with models, validating an email without the help of devise. Ensuring the password is secure using bcrypt. 
- Creating controllers without using generate methods.
- Creating migrations and editing tables/DB's.
- Enable log in/sign up without using gems such as devise.
- Using partials to minimise writing code on the front end. 
- Being able to write model tests. 
- REST - Mapping HTTP verbs to CRUD actions. HTTP verbs are get,post,put/patch and destroy.
- Understanding of MVC due to rails strict layout.
- Using the rails console to test my own theories and interact with objects and the DB directly. 
- Learning how to write model specs.
- Getting more comfortable with feature tests using capybara.
- Using Heroku to deploy the project. 

## Problems faced:

- Deploying to heroku was an issue for me. My ruby version in the gemfile did not work with heroku 20 so i had to change the version to 2.6.6 and then the bunlder needed updating. Once this was done, i used a ENV variable in the database.yml file for production and ran 'heroku run rails db:migrate" and the app was finally deployed to heroku.

- I cloned the repo into a new enviroment and was not able to run local host, i was getting an error that said i had to require bootstrap. When i looked into these errors and fixed them i got further errors about webpack and its manifest. To resolve all the errors i need to run yarn if i clone the repo into a new enviroment.

- When testing my application i wasn't able to pass a user_id correctly when creating an article. Using rails console i tested multiple theories and came to a solution that worked. 

## Successes :

- More comfortable and confident using ruby on rails.
- Creating associations between models. 
- Learning how to create an authentication system without devise.
- More comfortable about testing within rails. 
- Being able to create a good looking application with bootstrap. 
- Getting the project on heroku. 

## What i could have done better? :
- Followed TDD more strictly. 
- Used a trello board to help with my tickets. 
- Used branches more often. 


## How to add to this project? :

- Articles can be tagged into categories like common social media platforms. 
  - Create category model.
  - Need to create a articles category table with article and category id. 
  - Create article category model that belongs to article and category. 
  - The article model and Category model will have "has_many article categories" and then "has many ** through article categories". 
  - Allow article params to allow the array of category ids.
  - Allow select box for categories that will allow user to select multiple. 
  - Display the categories on the article.
 
 - Being able to add other Users as friends. 
 - Being able to message other users using actioncable and Websockets
  
## A better way to write existing code?: 

- Using vue.js to make an interactive website. No refreshes. 
- Split the front end and back end.
  - Javascript on the front end and Rails on the backend.
  - Backend functions return json
  - Make API calls from the frontend with Javascript. 
- Authentication with Mailer folder

