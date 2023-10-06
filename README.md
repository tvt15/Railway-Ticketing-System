Admin creds-

User id- [admin@admin.com](mailto:admin@admin.com)

Password-123456

**After Admin Login-**

The landing page has links to-

1. Edit Admins Profile (w/ restrictions)
  1. It lists out the username, name and email id , while letting him change phone no, address and Credit Card Number.
2. Show passengers Table
  1. The Passenger Details are listed out in a table with buttons to add/view/update/delete the entries.
3. Show trains Table
  1. The Trains details are listed out in a table with buttons to add/view/update/delete the entries along with book train and add reviews for admin.
  2. Two search filters are added with a button to filter out trains based on termination/departing station
4. Show tickets Table
  1. The Tickets details are listed out in a table with buttons to delete the entries.
5. Show Reviews Table
  1. The reviews details are listed out in a table with buttons to add/view/update/delete the reviews
  2. Two search filters are added with a button to filter out reviews based on train number and passenger name
6. A filter has been added to filter out Passengers by given Train number.

**After Passenger Signup-**

1. A form is added that takes in Name, Email, Password, Phone, Address, Credit Card with necessary validations and no field can be left empty.

**After Passenger Login-**

1. Passenger Details are listed out
2. There are 3 side actions
  1. Edit profile-
    1. Lists out all the passenger details and lets them update them
  2. Destroy profile-
    1. This lets the user delete their profile
  3. Logout-
    1. Letting the user logout of their account.
3. There 4 Main actions-
  1. Show Available Trains-
    1. Lists out all the Upcoming Trains that have more than 0 seats left.
    2. With buttons to see the trains reviews, book a ticket and cancel the ticket.
      1. Passenger can book multiple tickets, and also for other passenger
    3. A search filter has been added for filtering trains based on their departure and termination station.
    4. A Drop down filter has been added to filter out trains based on the average rating of the train.
  2. Show Travel history-
    1. Lists out all trains that the user has previously traveled on.
  3. Show My Bookings-
    1. Lists out all the current bookings of the user as well as bookings done by him/her for other passenger.
  4. Show My Reviews-
    1. Lists out all the reviews that the user has written for all the trains.
    2. A button to update the review that is authored by the user.


BONUS:
Both bonus have been implemented
1) Present on admin home page
2) Present at book ticket option in passenger login
