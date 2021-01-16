# README

This application allows borrowers to apply for loans with different lenders. There are three different types of loans: Student loan, Home Improvement Loan (HIL) and Consolidation loan.
After borrower applies for a loan, the loan shows under the dashboard for the corresponding lender and lender can approve the loan. After loan approval, the borrower sees loan status "Accepted". While waiting for approval, the loan status shows "Waiting".

## Getting started

To get started with the app, clone the repo and then install the needed gems:

* bundle install

Next, migrate the database:

* rake db:migrate

Then run the app in a local server:

* rails server

## Contributing

Bug reports and pull requests are welcome on GitHub at

## Additional Information

Borrower must Signup first in order to apply for a loan. Two type of login is offered to user/borrower: with email address and password or login with Google using Google Omniauth Strategy. In order to test Google Omniauth Strategy you need to create .env file
under the root directory.
There is a separte signup and login for lender.

### License

All source code is available under the MIT License. See LICENSE.md for details.

