# GiveMeFoodBot for Telegram

<img src="https://telegram.org/img/t_logo.png" width="48"> <img src="https://pixabay.com/static/uploads/photo/2013/07/13/13/41/robot-161368_960_720.png" width="48"> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/2000px-Ruby_logo.svg.png" width="24"> 

##### A simple [Telegram](https://telegram.org) bot written in [Ruby](https://www.ruby-lang.org/en) to search for nearby restaurants.   

This is an initial pilot project to create Telegram bots.  
I'd like to share the project so it can help anybody else interested in getting into the development of bots for Telegram or any other platform.  
I share my project under GPL License, so everybody can reuse and modify it.  

### Important note
This Bot is *LIVE* for Telegram under the name **@GiveMeFoodBot**.  
But it's not intented to be used widely, due to the limitations on the implementation and deployment server I've choosen.  
The Bot is running using a <img src="https://twemoji.maxcdn.com/36x36/1f409.png" width=28 height=28> [*FREE Dyno*](https://blog.heroku.com/archives/2015/5/7/heroku-free-dynos) on [*Heroku*](http://www.heroku.com), which means it won't be up always, because *FREE Dynos* like sleeping <img src="https://twemoji.maxcdn.com/36x36/1f634.png" width=28 height=28><img src="https://twemoji.maxcdn.com/36x36/1f634.png" width=28 height=28>.  
In addition, it's in my plans to extend the bot further, so it will be for sure unstable in several moments.  
  
**All contributions and ideas are welcomed**.  

    
# Step by Step project explanations

For the persons new to [Ruby](https://www.ruby-lang.org/en) and BOTs, like me, here are some explanations about how I created the project from scratch.  
  
  
I'll cover the following points, giving examples taken from this project:  

1. Creating your bot in Telegram.
2. Creating the first ruby file for your bot. 
3. Requiring and installing external ruby gems.
4. Generating **Gemfile**.
5. Generating **Gemfile.lock**.
6. Completing your first ruby file with meaningful code for running bot services.
7. Deploying your bot.  

   a. Registering to **HEROKU.**  
   
   b. Installing **HEROKU Toolbelt**.  
   
   c. Creating your bot app in **HEROKU** using *Toolbelt* from the command line.  
   


# 1. Creating your bot in Telegram

<img src="https://core.telegram.org/file/811140327/1/zlN4goPTupk/9ff2f2f01c4bd1b013" width="200" align="center"> 

The first thing you need to do is to contact [BotFather](https://core.telegram.org/bots#3-how-do-i-create-a-bot).  
You can follow the link above for detailed explanations from the Telegram docs about how to create your app.  
This will register your bot app with Telegram. At this moment is not required to have any code or anything ready, you just will tell *BotFather* that
you want a new bot to be created, he'll register the name you've choosen and will give you a **TOKEN** that is the first thing you need to connect
from your code to [Telegram Bot API](https://core.telegram.org/bots).  

Here I'll present the minimum steps you need to perform at least.  
  
  
1.  Start the bot tipying **@BotFather** in Telegram.    

![BotFather](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/1%20-%20contacting%20BotFather/1%20-%20start%20the%20bot.png)  

Or alternatively go to this URL and it will ask you if you want to start a conversation with botfather [BOT FATHER URL](https://telegram.me/botfather)

You can also start a new conversation, typing "botfather" as the name of the contact.

<img src="https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/1%20-%20contacting%20BotFather/7%20-%20contacting%20botfather%201.png" width="400" align="center"> 
<img src="https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/1%20-%20contacting%20BotFather/8%20-%20contacting%20botfather%202.png" width="400" align="center"> 


2. Execute **/newbot**.   

![newbot](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/1%20-%20contacting%20BotFather/3%20-%20execute%20:newbot.png)  


3. Receive your **TOKEN** and save it.   

![token](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/1%20-%20contacting%20BotFather/4%20-%20newbot%20created%20a%20TOKEN%20is%20given.png)  

4. See more steps in the [docs folder](https://github.com/barbaramartina/ruby-telegram-bot/tree/master/docs/1%20-%20contacting%20BotFather).  


# 2. Creating the first ruby file for your bot

Create an empty file in any aproppiate folder in your system. As example from this project:  

 **../src/GiveMeFood.rb**

# 3. Requiring and installing external ruby gems

We need to say which ruby gems we'll be using. Add the following lines at the beginning of *GiveMeFood.rb*

    require 'telegram/bot'
    require 'google_places'

### Current project dependencies

In the case of this project, I'm using:  

- Gem [telegram-bot-ruby](https://github.com/atipugin/telegram-bot-ruby)
- Gem [google_places](https://github.com/qpowell/google_places)

#### Versions

    gem 'google_places', '0.32.0'
    gem 'telegram-bot-ruby', '~> 0.5.0.beta4'
    
### Install RubyGems

[RubyGems](https://rubygems.org/pages/download) is a package management tool, if you don't have **RubyGems** installed in your system, follow this link and install it: https://rubygems.org/pages/download

After installing **RubyGems**, go ahead and install the gems required for this bot.  

Open the terminal and type the following commands, one per time:  

    gem install google_places  
    gem install telegram-bot-ruby
   
The previous commands will install the gems in your system.  


# 4. Generating **Gemfile**

Go to the root folder of your ruby main file, **GiveMeFoodBot.rb** and execute:  


    bundle init
    
You will see a log like the next one:  

![bundleinit](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/2%20-%20creating%20app%20with%20toolbelt/13%20-%20using%20ToolBelt%20-%20After%20reading%20DOCs%2C%20go%20and%20create%20Gemfile%20with%20bundle%20init.png)  


# 5. Generating **Gemfile.lock**  

In the same folder as the last step execute:  

    bundle install
   
You will see a log as the following:  

![bundleinstall](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/2%20-%20creating%20app%20with%20toolbelt/20%20-%20using%20ToolBelt%20-%20FIX%20ERROR%20running%20bundle%20install.png)  

# 6. Completing your first ruby file with meaningful code for running bot services  

See the code inside **GiveMeFoodBot.rb** as an example.  Or check the github repos for the [Ruby Telegram BOT API in Ruby I used](https://github.com/atipugin/telegram-bot-ruby) to have an idea about what you can do.  

# 7. Deploying your bot  
   
These steps are specific to the server I've used for deploying my bot.  

You can choose to deploy your bot anywhere else, on your personal PC is a good idea until you have it running, but you could
also choose another server or a Raspberry Pi for example. Check out the useful links at the end of the README.  

## a. Registering to **HEROKU.**  

Go to [**HEROKU**](https://www.heroku.com/) and sign up for a FREE account.  

## b. Installing **HEROKU Toolbelt**  

Go to [**HEROKU ToolBelt page**](https://toolbelt.heroku.com), download and install in your computer.  

I did everything in OSX El Capitan.  

## c. Creating your bot app in **HEROKU** using *Toolbelt* from the command line

Here are the steps you need to follow using ToolBelt.  

### 1.  From the root folder of your bot project execute in the terminal:  

  `heroku login`
    
![login](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/2%20-%20creating%20app%20with%20toolbelt/1%20-%20using%20ToolBelt%20-%20LOGIN.png)
    
### 2.  Execute create app command:  

  `heroku create 'yourAppName'`
    
![create](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/2%20-%20creating%20app%20with%20toolbelt/4%20-%20using%20ToolBelt%20-%20Create%20app%20GOOD%20name.png)
    
### 3.  Clone the repo created for you:  

`git clone 'yourRepoURLHerokuGAVEYou'`  
    
![clone](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/2%20-%20creating%20app%20with%20toolbelt/5%20-%20using%20ToolBelt%20-%20%20Cloning%20created%20repo.png)
 
### 4. Add the ruby buildpack required by **HEROKU** execute:  

`heroku buildpacks:set heroku/ruby`    
    
  ![builpacks](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/2%20-%20creating%20app%20with%20toolbelt/8%20-%20using%20ToolBelt%20-%20Adding%20buildpack%20for%20RUBY.png)
   
### 5.  Go to your repo main folder, add all your code if it was not added before and execute push to the main repo.  
The main repo can be renamed to heroku (the name you will see in all the documentation) but you can keep it to origin or anything else you want.  

  ![push all code](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/2%20-%20creating%20app%20with%20toolbelt/23%20-%20using%20ToolBelt%20-%20git%20push%20origin%20master%20OR%20git%20push%20heroku%20master%20if%20you%20repo%20is%20named%20heroku.png)
  
### 6. Check the warnings if any.  
  In my case I had not set the Ruby version. So I added it to my Gemfile:  

  `ruby '1.9.3'`  
     
  And I had not created a **VERY IMPORTANT FILE SO YOUR BOT CAN RUN ON HEROKU** so I created the Procfile.    

   ![procfile 1](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/3%20-%20checking%20your%20app%20in%20Heroku%20panel/5%20-%20heroku%20panel%20-%20checking%20the%20warning%20while%20using%20Toolbelt%20I%20saw.png)
   ![procfile 2](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/3%20-%20checking%20your%20app%20in%20Heroku%20panel/6%20-%20heroku%20panel%20-%20create%20a%20GOOD%20PROCFILE%20for%20the%20bot.png)

### 7. **ALL SHOULD BE RUNNING AND READY ON HEROKU BY NOW**  

  **To check your app is running do the following:**   

     a. CHeck your app was created.  

  ![created app](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/3%20-%20checking%20your%20app%20in%20Heroku%20panel/1%20-%20heroku%20panel%20-%20checking%20app%20was%20created.png)

    b. Check your app was recognized as a bot and the command you put in *Procfile* is OK.    

  ![bot config](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/3%20-%20checking%20your%20app%20in%20Heroku%20panel/10%20-%20heroku%20panel%20-%20go%20back%20to%20your%20Heroku%20panel%20and%20check%20the%20Dynos.png)

    c.  Click EDIT and ENABLE your bot so it can start running.  

  ![enable](https://github.com/barbaramartina/ruby-telegram-bot/blob/master/docs/3%20-%20checking%20your%20app%20in%20Heroku%20panel/11%20-%20heroku%20panel%20-%20click%20EDIT%20and%20ENABLE%20your%20Dyno.png)

  d. **CELEBRATE!!** your bot is running. <img src="https://twemoji.maxcdn.com/36x36/1f389.png" width=28 height=28><img src="https://twemoji.maxcdn.com/36x36/1f389.png" width=28 height=28><img src="https://twemoji.maxcdn.com/36x36/1f389.png" width=28 height=28>   


# Note about the docs folder  

In the doc folder you will see screenshots for all the steps and errors I got while creating my app in **HEROKU** using *ToolBelt* and 
the troubleshooting I did for having my bot running in **HEROKU**.  
Go there and check in order every image file you find. Are enumerated following the process I did.  

#Useful links I've found in my way while creating the project

* [Telegram Bot API](https://core.telegram.org/bots/api)
* [BotFather: the first thing you need to do for creating your bot](https://core.telegram.org/bots#3-how-do-i-create-a-bot)
* [Ruby Language Tutorial](http://www.tutorialspoint.com/ruby)
* [BOT Wiki: a lot of resources for creating BOTS](https://botwiki.org)
* [Heroku: Toolbelt](https://toolbelt.heroku.com)
* [Heroku: buildpacks](https://devcenter.heroku.com/articles/buildpacks)
* [Heroku: deploying with GIT](https://devcenter.heroku.com/articles/git)
* [Heroku: how to deploy your SLACK bots](https://blog.heroku.com/archives/2016/3/9/how-to-deploy-your-slack-bots-to-heroku)
* [Bundler & RubyGems](http://bundler.io/v1.5/gemfile.html)
* [Quick instructions for creating a Telegram BOT in Ruby](http://www.sitepoint.com/quickly-create-a-telegram-bot-in-ruby)
* [Example of a Twitter BOT](https://github.com/mono0x/heroku-twitter-bot/blob/master/Procfile)
* [Reddit question: where do you host your bots?](https://www.reddit.com/r/TelegramBots/comments/3veo3e/question_where_do_you_host_your_bots)
* [Hosting your bots on a Raspberry Pi](http://www.jeffreythompson.org/blog/2014/08/31/setting-up-raspberry-pi-to-run-bots)
* [Python: where to host your bots](https://github.com/python-telegram-bot/python-telegram-bot/wiki/Where-to-host-Telegram-Bots)

