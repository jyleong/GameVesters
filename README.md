# README

CMPT 470 Group 1's Final project

By: James Leong
	Riku Kenju
	Carlson Chan
	Tyler Wong
	Eric Liu

to run app in development mode

navigate to ./Final_Project

----------------------------------------------------

Notes for seeding database:

clear initial db by
rails db:migrate:reset

this resets db under db/seeds.rb

you can put your own scripts to seed database here

in example creates fake admin user 99 fake users and the follow graph

----------------------------------------------------
to run in regular development mode (our own work/testing)

clear db
seed db

rails db:seed

rails s <- start server

----------------------------------------------------
to run in integrated development mode (vagrant for same env)
run vagrant up

go to browser and open up localhost:3000

If wanting to deploy production mode:

When migrating (or doing other management commands), make sure you specify production mode:

rake db:migrate RAILS_ENV=production

----------------------------------------------------

FOR DEV WORK AND COMMITS (THAT MEANS YOU TOO TYLER)

** We will have a master branch and a development branch

we will merge to development first before updating the master for our final project

do this by

pulling initial repo then

$git checkout -b origin/development

make your own branch from here as stated in step 1)

1) everyone works on their own branch
	start a branch by 
	$git checkout -b <yourbranchname>

2) commit and add changes to your own branch
	$git add -A
	$git commit -am <commit message>
	$git push

3) to merge
	follow practice like in real sw engineering
	make pull requests to merge to our dev branch
	others to review code before merging
	

