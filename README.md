# Flight Booker
Created as part of [The Odin Project](https://www.theodinproject.com) curriculum.

View on [Github](https://github.com/harmolipi/odin-flight-booker).

### Functionality

This is the [Flight Booker](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/flight-booker) project, where I'm creating more advanced forms by building a typical checkout process for booking a one-way flight.

Also added confirmation emails with users' flight details, for a [later lesson](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/sending-confirmation-emails) in using ActionMailer.

### Thoughts

#### Part 1

This project was a good exercise in using nested forms to create multiple objects at the same time. In this case, once a flight is selected, a form prompts the user for passenger information, and when it's entered, the form creates both a new Booking record, associated with new Passenger records.

It took some tinkering to figure out the nested forms, but it was pretty straightforward, and wasn't too difficult to figure out. In fact, most of the time I spent on this project was spent on nicely presenting the flight information - specifically the search results form. The flight results had to not only be displayed clearly, but also serve as a form allowing the user to select a flight to book.

Initially I tried to do this with a table, but I don't believe it's possible to set an entire table row as a radio button's label, so that a user can click anywhere on the row. I ended up using a [Bulma](https://www.bulma.io/) panel full of tiles for the flight search results, which allowed for each row to serve as one big label for that radio option.

#### Part 2

The Odin Project had me dust this one off again for [part 2](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/sending-confirmation-emails/). This entailed adding confirmation emails to the system, so that each passenger on the booking would receive an email with their flight information when their booking is created. This was a good exercise in learning about ActionMailer, and how to send emails from a Rails app.

I initially had some trouble setting up emails to be sent through [SendGrid](https://sendgrid.com/) because of an error saying that my account had been banned when I tried to add the Heroku add-on. I was able to add the add-on to my [odin-facebook](https://github.com/harmolipi/odin-facebook) project though, and once I was set up with an account, I found I could use SendGrid without the Heroku add-on. So I came back to this project and simply generated a new API key in SendGrid and updated my settings here, and it all works.

God bless.

-Niko Birbilis
