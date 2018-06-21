
# mattboldt_blog branch

To set up:

```
git clone -b mattboldt_blog https://github.com/kalkomey/intern_blog.git
cd blog
bundle install
rake db:migrate
rake db:seed
rails server
# Visit http://localhost:3000/
```

In another terminal tab, run the tests:
```
rspec
```

# Intern Blog Project
Create a Rails application to allow multiple authors to create blog posts on a single website.  The following pages should be present on the website.

## Index page:
  - List of the 5 most recent blog posts
  - List should include:
    - title of the blog post
    - first 100 words of the post body
    - Author name
    - date blog was posted
  - title should link to the post show page
  - Author name should link to the author's show page
  - A link on the page to create a new blog post
  - A link to create a new author

## Post Show page:
  - Title
  - Timestamp of date posted
  - Post body
  - A link on the page to edit the blog post

## New Post page:
  - Title form field
  - Body textarea
  - Select box to choose Author
  - Save button
  - post *must have* a body and a title
  - title can't be more than 100 characters

## Edit Post page:
  - Title form field, already populated
  - Body textarea already populated
  - Select box to choose Author
  - post *must have* a body and a title
  - title can't be more than 100 characters
  - save button

## Author Show page:
  - Author full name
  - Author's date of birth
  - list of all Posts created by the author

## New Author page:
  - First name field
  - Last name field
  - DOB date selector
  - DOB must be in the past

## Edit Author page:
  - First name field
  - Last name field
  - DOB date selector
  - DOB must be in the past

## Stretch goals:
  - Save a 'slug' for the blog post and use that instead of the post ID for the show page url
  - Nice styling (check out Bootstrap for a good starting point)

## Super Stretch Goal
  - Add user registration and login
    - where user's are Authors
    - check out the Devise gem for this
