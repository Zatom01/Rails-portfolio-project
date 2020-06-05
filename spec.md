# Specifications for the Rails Projects

Specs:
- [x] Use Ruby on Rails framework
- [x] must include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

User has_many posts
Post belongs_to a user
User has_many commented_post through post_comments
Post has_many users_who_commented through post_comments

- [x] must include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

User has_many :commented_posts, through: :post_comments, source: :post
Post has_many :users_who_commented, through: :post_comments, source: :user
Post_comment belongs_to :user
Post_comment belongs_to :post
Post_comments user-submittable attributes: username, body


- [x] models must include reasonable validations for the simple attributes to avoid invalid data.

Validates presence of Post's content while creating
Validates presence of PostComment's username and body while creating

- [x] must include at least one class level ActiveRecord scope method

scope :famous_users, -> {where("view > ?", 50)}

def self.in_age(age)
    where(:age => age)
end

can be used as User.famous_users which will then return users whose "view" attribute is greater than 50.
can be further chained with class method by User.famous_users.in_age(30) will return famous_users whose "age" attribute is 30.

route=> '/users/famous_user'


- [x] application must provide standard user authentication, including signup, login, logout, and       passwords.

Devise gem

- [x] authentication system must also allow login from some other service.

Github and Google with the help of Oauth

- [x] must include and make use of a nested resource with the appropriate RESTful URLs.
- [x] forms should correctly display validation errors.
- [x] application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.
- [x] should not use scaffolding to build your project

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
