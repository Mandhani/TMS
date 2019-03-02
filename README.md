# TOUR MANAGEMENT SYSTEM

To aid a customer who wants to book tours, and agents who wants to be tour guides by providing various services to customers.

live app - https://toursys.herokuapp.com/

Git repository - https://github.com/Mandhani/TMS 

### Admin Username and Password (Please delete browser cookies)
###### Username - admin@tms.com
###### Password - password


### Sample Customer login details 
###### Username - sampleuser@tms.com
###### Password - password


### Sample Agent login details 
###### Username - sampleagent@tms.com 
###### Password - password


## While testing the application, please note:
* A user can only sign-up as a customer or an Agent.
* After signing-up a user maybe redirected to the home page of a customer or an Agent, based on what is selected during the sign-up process.
* Or the users can login with their credentials themselves.

## Admin Module:
- An admin can create new users, view, edit, or delete the existing users(both agents and customers). 
- An admin can create new tours, view, edit, or delete the existing tours created by the agents.
- An admin can view the customers who registered for a tour,or bookmarked a tour.
- View the reviews of a tour.
- Admin can edit his own profile details including username and password.

## Agent Module:
- An agent can sign-up giving his details, login.
- can update their profile. 
- can add new tours.
- can delete their own tours(tours listed by them).
- can view all the tours(listed by other agents and admin).
- view list of customers that have bookmarked a tour listed by them.
- view reviews of a tour.
- delete their account.
- An agent can also signup as a customer with the same details he used for an Agent profile.
- can view the reviews for any tour.

## Customer Module:
- A customer can signup and login with their credentials.
- can edit their profile information including username and password.
- view all tours.
- bookmark a tour
- view tours bookmarked by them.
- book a tour.
- cancel a booked tour.
- delete their account.


### Checking the functionalities of Admin,Agent and customers:

#### Admin:
- Can admin login? - yes
- can admin view all the users in the system? - yes
- can admin edit his profile information? - yes
- can admin create or delete users? - yes
- can admin create new tours? - yes
- can admin edit or delete the tours created by agents? - yes
- can admin view reviews of all tours? - yes
- can admin view the passwords of all the users in the system? - no

#### Agent:
- can agent signup? - yes
- can agent login? - yes
- can agent edit his profile? - yes
- can agent create new tours? - yes
- can agent edit/delete his own tours? - yes
- can agent edit/delete tours created by other agents? - no
- can agent view all the tours? - yes
- can agent view customers who bookmarked his tour? - no
- can agent delete his own account? - yes

#### Customer:
- can a customer signup? - yes
- can a customer login? - yes
- can a customer edit his profile information? - yes
- can a customer view all the tours? - yes
- can a customer book a tour? - yes
- can a customer be waitlisted when seats are not available? - yes
- can a customer cancel his booking? - yes
- can a customer search for the tours using filters - no
- can a customer view information about tours? - yes
- can a customer submit a review? - no
- can a customer Edit or delete a review they previously submitted? - no
- can a customer delete his own account - yes

