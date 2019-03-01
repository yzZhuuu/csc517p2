# CSC 517 (601) - Object Oriented Design and Development
## Project 2: Tour Management System
### Team_25
* Hao Lu (hlu6@ncsu.edu)
* Shuai Wang (swang28@ncsu.edu)
* Yuzhe Zhu (yzhu45@ncsu.edu)

### Deployment Application
Tour Management System App is deployed onto [AWS](http://ec2-18-188-159-107.us-east-2.compute.amazonaws.com:3003/) Cloud Application Platform.

http://ec2-18-188-159-107.us-east-2.compute.amazonaws.com:3003/
### Configurations

#### Application Development Environment
* Ruby version: 2.3.7
* Rails version: 5.2.2
* Sqlite3 1.3.6

#### Admin Account 

    Name:       GodOfWeb

    Email:      god@admin.com

    Password:   password

#### Default Agent Account 

    Name:       FirstAgent

    Email:      agent@gmail.com

    Password:   password

#### Default Customer Account 

    Name:       FirstCustomer

    Email:      customer@gmail.com

    Password:   password

### User Guide
There are three (3) types of users in the system:
* Admin
* Agents
* Customers

#### Admin
* Login 
    * Name: GodOfWeb
    * Email: god@admin.com
    * Password: password
* Edit profile
    * You can always directly edit your account profile at the top-right of the page by click **"Edit profile"**.
* Go to Admin Dashboard
    * Click the link named as **"Admin Dashboard"** on the top bar of the page, you will be link to the admin dashboard page. You could get most of information of this app here, and edit the profiles of users and tours. 
    * Click the **"Home"** button will back to Home Page. 
* Create agent and customer accounts (users)
    * When you are in the admin dashboard page, you could create agent and customer by click **"New User"** button.
    * **For the role, you must either enter "agent" for agent or "customer" for customer. Please don't enter other words**
    
* View the list of all users and their profile details (except password).
    * When you are in the User page of the admin dashboard, you should be able to view the list of all users. 
    * You could click any users on the list, you will be link to the user's profile details page. 
    * You are be able to **sort the list** by click the any title on the list. You could click the **"Role"** on the title line to sort all users as "admin-agent-customer" order.
    * You are be able to search Users by using the **search box** above the user list. Enter anything and **press Enter on your keyboard**.
* View the list of all tours, along with detailed information.
    * Click the link **Tours** on the left bar. you will go to the Tour page of the admin dashboard, you should be able to view the list of all tours. 
    * You could click any tours on the list, you will be link to the tour's profile details page. 
    * You are be able to **sort the list** by click the any title on the list. 
    * You are be able to search Tours by using the **search box** above the tour list. Enter anything and **press Enter on your keyboard**.
* View all fields of reviews (defined below) from customers.
    * Click the link **Reviews** on the left bar. you will go to the Review page of the admin dashboard, you should be able to view the list of all reviews. 
    * You could click any reviews on the list, you will be link to the review's profile details page. 
    * You are be able to **sort the list** by click the any title on the list. 
    * You are be able to search reviews by using the **search box** above the reviews list. Enter anything and **press Enter on your keyboard**.
* Create, edit or delete users (agents or customers)/tours/reviews from the system. 
    * You will be able to edit or delete users/tours/reviews on the right of the list by click **"Edit"** or **"Destory"** link
    * You will be able to create the new users/tours/reviews on the top-right of the list page by click **"New User/Tour/Review"** button. 
* View all book list and wait list. 
    * Similarly, you could view the book list and wait list by click the link **"Books"** and **"Waitlists"** on the left bar.
* _**All the functions except view/create/edit/delete users, admin have the authorization directly to view/create/edit/delete from the home page. The Admin Dashboard is just help admin to control the web more organized.**_ 
    * You also have access to **Agent Center** and **Customer Center** , you can view all the customer and all agent information during each center instead of just view the information by yourself.
#### Agent
* Login 
    * Fast account
        * Name: Agent1
        * Email: agent1@gmail.com
        * Password: password
    * You should be able to sign_up a new agent account during the login page. 

* View all tours (including those listed by others)
    * Go the **All Tours** page by Click the link **"All Tours"**. You can view all the tours.
* View your tours (excluding those listed by others)
    * Go the **Agent Center** page by Click the link **"Agent Center"**. You can view all the tours created by you.
* List a tour.  
    * Under the **All Tours** page. Click the link **"create a new tour"** on the bottom of the tour list to list a new tour.
    * You can also create a new tour under **Agent Center** page by click the link **"create a new tour"** on the bottom of the tour list to list a new tour.
* Edit/update/delete/cancel tours that they have posted. 
    * You can edit/delete your tours directly in the All Tours page by click the link **"Edit" or "Destroy"** in the list.
    * Also,under My Tours You can edit/delete your tours in your tours list by click the link **"Edit" or "Destroy"**.
    * You Cannot edit/delete tours posted by other agents, if you tried, you will showed unauthorized and nothing happened.
* Upload and delete pictures of tours that they themselves have listed. 
    * You should be able to upload and delete pictures when under the tour's details page of the tour. 
        * Go to Click the link **"show"** on the right of the tour
        * Find the line **"Check Photos"**, and click the link **"link to photos"** 
        * You can upload your photos in here by click **"Add a photo"**, or destroy it by link **"Destroy"**.
* View list of all customers who have bookmarked a tour (created by them).
    * Under **Agent Center** page, you are able to see the bookmark list of all customers who have bookmarked a tour.
* View list of all customers who have booked a tour.
    * Under **Agent Center** page, you are able to see the book list of all customers who have booked a tour.
* View reviews of a tour.
    * You are be able to view reviews under the tour's details page by click the link **"show"** after any tour.
* Agent should be able to delete his own account.
    * You could delete your account by click the link **"Edit Profile"** right of your emails to go to your profile, and then click the button **"Cancel My Account"**.
  
#### Customer
* Login 
    * Fast account
        * Name: Customer1
        * Email: customer1@gmail.com
        * Password: password
    * You should be able to sign_up a new customer account during the login page. 
    
* View all tours 
    * Go the **All Tours** page by Click the link **"All Tours"**. You can view all the tours.
* Search available tours using filters, such as start date range, price range, tour name, slot availability and locations visited during the tour (Itinerary)
    * You can find the **search bar** to search the key word of the tours above the list in the All Tour page.
* View information about tours
    * Go to the **Tour Details Page** by click the link **"show"** right after a tour in the tour list.
    * Under **Tour Details Page** Click the link **"link to photo"** to view the photo.
* Bookmark tours they are interested in.
    * In the Tour Details page, you are be able to make a bookmark by click the button **"Bookmark"**.
    * You can cancel a bookmark by click the button **"Undo Bookmark".**   
* Book n seats on a tour.
    * In the Tour Details page, you can book n seat under the **Book seat**. 
    * If the number of seats you want to book is **less or equal** than the available seat, you should select:
        * **nothing:** Book the seats.
    * If the number of seats you want to book is greater than the available seat, you should select:
        * **wait:** Add customer to waitlist along with requested seats
        * **continue:** Book the seats available; and add remaining seats to waitlist
        * **cancel:** Cancel transaction
* Cancel a booking completely or cancel a few seats from a booking done previously.
    * You can cancel the booked seat by click the link **"Destroy"** right after the book on the booklist.
* Submit a review for a tour that that customer has already taken. 
    * After you booked a tour, you are able to write the review with **subject** and **message** under the **Tour Detail page**.
* Edit or delete a review they previously submitted.
    * You can edit or delete your review anytime by click the link **"Edit"** or **"Delete"** under your review.
* Customer should be able to delete his own account.
    * You could delete your account by click the link **"Edit Profile"** right of your emails to go to your profile, and then click the button **"Cancel My Account"**.
* View all the booked/bookmarked/waited tour for the current customer
    * Go the **Customer Center** page by Click the link **"Customer Center"**.
    * You can view all the booked/bookmarked/waited information create by you. 
#### Extra feature
* All users can use their Google account (implementing any one of them is enough) to log into the system.
    * You can link your account with Google in the [Sign In](http://ec2-18-188-159-107.us-east-2.compute.amazonaws.com:3003/users/sign_in) page by press the button **"Sign in with Google"**. 
    * It will create a user account based on your google account(gmail).
* Send an email when the status of the customer moves from waitlist to booked.
    * When your seat is ready for you, the app will move you from waitlist to booked, you could check your email (linked with google) about the information.
#### Tours Features
* ID
* Name
* Description
* Seats - total seats, available seats
* Price
* Photos 
* Booking deadline
* Duration (from - to dates)
* Start location (where the tour starts from)
* Tour itinerary -  A list of places where the said tour will take you 
    * include at least one country; a tour can span multiple countries
    * include at least one state/province within each country; a tour can span multiple states
* Contact information for tour operator
* Status (In Future / Completed/ Cancelled).
* Bookmark function
* Book tour function
* Book list
* Wait list
* Review list



### Test

    





