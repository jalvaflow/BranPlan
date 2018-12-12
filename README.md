### By Joshua Alvarado, Simon Fekete, Runjie Lu ###
*(jalva@brandeis.edu, sfekete@brandeis.edu, lurunjie@brandeis.edu)*

## Our Mission ##
BranPlan is an academic planning application intended for the Brandeis University undergraduate community. Our vision is to have a platform which merges a variety of existing and new functionality in terms of academic planning and scheduling. 

## Story ##
As busy undergraduates, it's hard to allocate time for things other than coursework. Current university planning tools are one dimensional or limited in functionality, and some are outdated in their user interfaces. When registration time comes around, students often find themselves frantically searching for courses that relate to their studies. Additionally, booking advising appointments to better understand ones university progress and goals is time costly, as sometimes advisors are not readily available for meetings and require long wait times. Despite having the necessary tools needed for academic tracking on separate outlets, it would be beneficial for students to have a one-stop shop for all these functions.

## Technology & Technique ##
### Language and Structure ###
- Ruby on Rails, JavaScript, JQuery, Turbolink, AJAX, HTML, SASS, CSS, PostgreSQL
### External API’s/Packages ###
- Google OAuth/Brandeis Auth 
- Bootstrap
- Fullcalendar & Datetimepicker Gem
  - Used for the scheduling of classes. Upon adding or deletion of a course section, the calendar would reflect the change.
- Pagination Gem
  - Helped in making large listing of data more concise, such as on the search and user profile pages.
- Select2 Dropdown
  - Implemented in order to allow users to select up to 3 of the degrees we support.
- Scroll Reveal API
  - Animation API which on focus after scroll would fade in elements. Used in the home page for our features section.
- W3 Animations
  - Used in the slideshow displaying user submitted comments about our service.
- Gmail Automation
  - Sending of a user generated email to a shared gmail account via our contact page feedback form.
- Ruby Decision Tree Package 
  - Simple importable decision tree package used for prediction algorithm creation and training. Implemented in the search page by being connected to the “suggest” button for courses.
- JSON Import Gem
  - Aided immensely in the populating of our models with the registrar JSON file. The file is massive so the Import Gem saves us a lot of time when seeding.
- Modal Gem
  - Used to show pop up events maker and details of all the entries. It is easy to format the page and make it more user-friendly.

## Product Overview ##
BranPlan was initially inspired by the functionalities provided by schdl.net and Sage, as we sought to combine the best of both on one platform. Schdl.net has an amazing database of course with a simple schedule template which is easy to understand. Sage has records for which degrees students are registered for, and their status toward completing them as well as general university requirements. Despite this, schdl.net is limited in functionality and Sage is often slow and difficult to navigate around. Using them as a framework as well as our own judgement, we decided on providing our users three fundamental tools:


- Ability to search/discover and keep a record of courses being taken.
- View progress toward degree and university requirements.
- Schedule auxiliary events on an interactive calendar. 
- Give suggestions for next semester’s courses

## Images and Snippets ##
![snippet](https://i.ibb.co/DQX4Q4f/image.png)

## Links ##
- Links to Github
[https://github.com/JAlva7/branplan](https://github.com/JAlva7/branplan "github")
- Links to Heroku
[http://branplan.herokuapp.com/](http://branplan.herokuapp.com/ "heroku")


