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

- Can type 'rails c' to use the console and test assumptions between model and model table. You can do model_name.all to get all data from the table, you can also you model_name.create to add data to the table using the rails console.

- A more preferred way to add data is by assigning a variable to the article model. `article = Article.new` . This then creates an object which has attributes of title and description, You can then assign title and other attributes like this: `article.title = "My article title"`. This will not be inserted into the database on assignment until you do article.save.

- A one liner: `article = Article.new(title: "third article", description: "third description")` which is followed by article.save

- Can find article by ID by using `article = Article.find(2)`. Can also use `article.first` or `article.last`

- Can use .destroy to delete from the table. It also hits the database straight away without .save method.

- Clear way to see routes, rails routes --expanded

- byebug can be used to pause the application and show what part of the code it is at, use 'continue' to carry on.

# Model

# Article Model

- For the article model, i added validations so extra information that is not needed cannot be given by a user. (Checkout active record validations, good resource) For example in models/article.rb i added a validation like this `validates :title, presence: true, length: {minimum: 6, maximum: 100 }`. This is saying in order for a article to be created you need a title to be present and the length needs to be inbetween 6 and 100 characters.

- Show method is used to find one row from the database. example: `Article.find(params[:id])`

- An index method is used to get all data from table, example: `Article.all`

- The new method creates an object but is empty and does not contain any information given by the user.

- Create method can be used to make a new article on a website. This can be done with `Article.new`. Usually you have to provide params but rails allows an article key to be used which is from the params hash and since we have an article model, rails can save them in the correct places within the table. As a secruity feature you have to use strong params like this `@article = Article.new(params.require(:article).permit(:title, :description))` This line is saying to allow an article key and permit a title and description from there to be used to create the object.When you have created the object, you will need to save the object. In this case you will need to do `@article.save` and then redirect it the show path by doing `redirect_to @article`

- The edit method: This is similar to the show method, it finds the article using the ID. This is then taken the view which is edit.html.erb. Here we used `form_with(model: @article, local: true)` Which makes the form submit to the update route and automatically fills in the form with the existing data from the article you want to edit.

- Update method: You find the article you want to edit using the ID, you then do `article.update(params.require(:article).permit(:title, :description))` with the edited fields. In addition to this i added a IF statement to show a flash message and redirect the user if the updated is sucessful. If the update is not sucessful it will redirect you back to the edit page.

- Delete method: Find the article by ID and then use `@article.destory`which will remove it from the table. Redirect the method to the list of articles.
  `redirect_to articles_path`.

- Adding links to the index.html. If the route has an ID you'll see to pass it through. For example the show link is created like this: `link_to 'Show', article_path(article)`.
  The first part is the name and then the route which takes the article ID. The route on the webpage would look something like 'articles/1'.
  The needed path can be found with `rails routes --expanded` and the prefix label tell you the path to use.

## Refactoring the articles model

- The line `@article = Article.find(params[:id])`has been used often in the code, so to keep the code DRY
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

- I cloned the repo into a new enviroment and was not able to run local host, i was getting an error that said i had to require bootstrap. When i looked into these errors and fixed them i got further errors about webpack and its manifest. To resolve all the errors i need to run yarn if i clone the repo into a new enviroment.

---

# Users model:

## Branches

- Our master branch needs to be in a deployable state at all time and since im going to be creating a new model i want to create a new branch called feature so i can keep updating the users branch until its deployable.

- Including validations for the user table, They're has to be a unique username and email present when created, no matter the case if they have same letters as another user it will not be valid. The username can be min length of 3 and max of 30. The email has no minimum length but has a max of 105 and uses a regex expression to ensure that the input for email should be in the correct format to be valid. Before the user is saved into the database a before_save action is taken to downcase the email so no uppercase letters are in the email.

- I started to use branches here for development. Quick tip is to use `git checkout -b user-articles-association` as it creates the new branch and checksout to it at the same time. After finishing with the branch you will want to commit changes and then `git checkout main`. Once is main you can merge the branch into the main branch, in this case we would run ` git merge user-articles-association`.

- I added the association between users and articles. First created a migration file for adding a column to articles called user_id that was a int. Then to establish the connection between the two models i had to add `belongs_to :user` in the article.rb model file and added `has_many :articles` to the user.rb model file. To ensure my development server did not crash when i wanted to access it, i hard coded the articles create function to give each article a user and the already existing articles had to be given a user. This is a short fix until authentication is implemented.

- To setup authentication we have to uncomment the bycrpt gem thats in the gemfile. Go to the users model and add `has_secure_password`. The next step would be to create a migration file to add a column into users where the password would be kept.

- Implemented creating a new user, to do this you need to assign a variable to User.new with user_params. It looks like this `@user = User.new(user_params)` The user_params function contains information taken from the form. Once this is done i use a IF statement to check if its save, if it is it will show a flash message and redirect you to articles page. If it does not save then it will render the user/new view again.

- Creating the Update method is very similar to the articles method, I copied the code from the articles controller and changes the names. I created a edit view which renders a form partial. The form partial is used to sign up and to edit a users account. The form partial includes this line `<%= f.submit(@user.new_record? ? "Sign up" : "Update Profile", class: "btn btn-outline-info btn-lg") %>`. It checks if the user exists and if it does it will change the button to say Update profile, if the user does not exist then it will say Sign up.

- Profile page: Created a show view which renders a article partial. Using a gravatar helper method which shows a image which is linked to the users email. The article partial uses `@articles` which is okay for the articles controller as that exists. For users that does not exist so in the show method i fixed this by doing ` @articles = @user.articles`.

- Bloggers page with all bloggers: Similar to showing all articles i created a page with all bloggers. I created an index action `@users = User.all` to get all users that have been created. Then followed this up by creating a index.html for users. I then copied the code from articles partial and updated the code to suit users. I lastly added a link to the navigation partial which sends a user to the bloggers list page.

- Pagination: This limits the number of items being shown on a page. Installed the gem and used bundle install, Then changed the index code for articles and user controller to contain paginate keyword and the show method for users controller also had to be changed. Then added a div with paginate class in the views where it was needed and added css.

# Sessions model:

- Created a sessions controller to allow users to log in.

- Created a new sessions method which is essiential a get request for the log in form.

- Created a create method which is a post request using the params from the log in form. Checks if the user exists and authenticates the username and password. Session[user_id] is assigned user.id if everything goes to plan and user will be shown a flash message and redirected. If it does not go to plan it will show a flash message and render the form again.

- Delete method takes place when user clicks log out. the Session[user_id] is set to nil, flash message shown and you are redirected to homepage.

- Added two helper methods. Current_user and logged in?. Current user method assigns a users to it if the session is created. To stop going into the database everytime the method is called i used `||=` which means if its not assigned already then assign it. Logged_in? method justs turns current_user into bool format. The second step was to clean the code up, i added these methods to the application controller so they can be used within other controllers. This meant that the methods could not be used in view anymore so i included `helper_method :current_user, :logged_in?` which allowed the methods to be used within a controller and the views.

- Used these two helper methods to add restrictions for example, only a user can edit their own profile and articles they have created.

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Deployment instructions
