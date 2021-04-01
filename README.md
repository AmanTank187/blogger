# Blog

Intro:
[BloggerHeroku](https://bloggerat.herokuapp.com/)

---

## Focus

- Back-end: Database associations, one to many, many to many.
- Front-end: Using bootstrap to make a good looking website.

## Approach

- Ensuring the fundamentals are done correctly
- Write the program from scratch and not rely on ruby magic / generators in order to get a good understanding of how rails work.

---

## Learnings

---

# Rails Console

- Can type 'rails c' to use the console and test assumptions between model and model table. You can do model_name.all to get all data from the table, you can also you model_name.create to add data to the table by the console.

- A more preferred to add data is by assigning a variable to the article model. `article = Article.new` . This then creates an object which has attributes of title and description, You can then assign title and other attributes like this: `article.title = "My article title"`. This will not be inserted into the database on assignment so you will have to do article.save.

- A one liner: `article = Article.new(title: "third article", description: "third description")` which is followed by article.save

- Can find article by ID by using `article = Article.find(2)`. Can also use `article.first` or `article.last`

- Can use .destroy to delete from the table. It also hits the database straight away without .save method.

- Clear way to see routes, rails routes --expanded

- byebug can be used to pause the application and show what part of the code it is at, use 'continue' to carry on.

# Model

# Article Model

- Adding a model to add validations so extra and uneeded information cannot be add to the database/table (Checkout active record validations, good resource)

- Show method is used to find one row from the database. example: `Article.find(params[:id])`

- An index method is used to get all data from table, example: `Article.all`

- The new method has nothing in there as it doesn't need to perform a action, just a get request to get the form on the screen and intialise the article with nothing in there. Once the form is filled it out in then follows a post request and peforms the creatr action.

- Create method can be used to make a new article on a website. This can be done with `Article.new`. Usually you have to provide params but rails allows an article key to be used which is from the params hash and since we have an article model, rails can save them in the correct places within the table. As a secruity feature you have to use strong params like this `@article = Article.new(params.require(:article).permit(:title, :description))` This line is saying to allow an article key and permit a title and description from there to be used to create the object.When you have created the object, you will need to save the object. In this case you will need to do `@article.save` and then redirect it the show path by doing `redirect_to @article`

- The edit method: This is similar to the show method, it finds the article using the ID. This is then taken the view which is edit.html.erb. Here we used `form_with(model: @article, local: true)` Which makes the form submit to the update route and automatically fills in the form with the existing data from the article you want to edit.

- Update method: You find the article you want to edit using the ID, you then do `article.update(params.require(:article).permit(:title, :description))` with the edited fields. In addition to this i added a IF statement to show a flash message and redirect the user if the updated is sucessful. If the update is not sucessful it will redirect you back to the edit page.

- Delete method: Find the article by ID and then use `@article.destory`which will remove it from the table. Redirect the method to the list of articles.
  `redirect_to articles_path`.

- Adding links to the index.html. If the route has an ID you'll see to pass it through. For example the show link is created like this: `link_to 'Show', article_path(article)`.
  The first part is the name and then the route which takes the article ID. The route on the webpage would look something like 'articles/1'.
  The needed path can be found with `rails routes --expanded` and the prefix label tell you the path to use.

## Refactoring the articles model

- The line `@article = Article.find(params[:id])`has been used often in the code so to keep the code DRY
  I have extracted the line into a private method called set_article. Due to the frequency of it being used, i have added
  a before action for the methods its used in. Example: `before_action :set_article, only: [:show,:edit, :update, :destroy]`.
  This keeps the code way more DRY than call the method each time where it is needed.

- The line `params.require(:article).permit(:title, :description)`is used twice so its extracted into a method called article_params
  and since its only used twice i have called it from where it needs to be called from.

  - Adding a partial file for similar views. syntax for partial is underscore then name like '\_messages.html.erb'
    then you render it when you need it like in application layout file "render 'layouts/messages'".
  - I want to make a partial for common code in edit and new.

## Styling!

- Good resources for styling:
  - ![Good colour combos](https://visme.co/blog/website-color-schemes/)
  - ![How to add bootstrap to rails app](https://www.mashrurhossain.com/blog/rails6bootstrap4)
  - ![Source for website images](https://unsplash.com/)

# Flash Messages

- Creating a flash message in order to show user if they have ran into errors whilst creating an article and creating a flash message to show they have created a article successfully.

# Extra learnings

- form_with helpers are very useful. Research them!

- REST - Representational state transfer: Mapping HTTP verbs to CRUD actions. HTTP verbs are get,post,put/patch and destory.

- resources provide REST-ful routes to rails resources(article)

# Problems faced:

- Whilst implementing the delete method for the article method i came across an unusual error which seemed to be coming from webpacker and the javascript tag within the layout/application.html.erb file. The error was that every time i would try to delete an article it would just show the article and was not understanding that i wanted a delete request. It Seemed like a deep rooted issue so i decided to create a new rails project and copy my code over... it started to work the way i intended it too. At this point on my previous repo i was 13 commits in.

![Previous commits](https://user-images.githubusercontent.com/37899538/112188037-8c7cb500-8bfa-11eb-875a-1efbe8657b60.png)

- Deploying to heroku was an issue for me. My ruby version in the gemfile did not work with heroku 20 so i had to change the version to 2.6.6 and then the bunlder needed updating. Once this was done, i used a ENV variable in the database.yml file for production and rain 'heroku run rails db:migrate" and the app was finally deployed to heroku.

---

# Users model:

## Branches

- Our master branch needs to be in a deployable state at all time and since im going to be creating a new model i want to create a new branch called feature so i can keep updating the users branch until its deployable.

- Including validations for the user table, They're has to be a unique username and email present when created, no matter the case if they have same letters as another user it will not be valid. The username can be min length of 3 and max of 30. The email has no minimum length but has a max of 105 and uses a regex expression to ensure that the input for email should be in the correct format to be valid.

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Deployment instructions
