# Weather360

This is a weather app which addresses the need for a fast and easy to manage article system,
while providing a focus on weather and climate information.

It uses Azure Virtual Machine, Azure Text-To-Speech, Java Servlet, JDBC, Tomcat, MySQL, JSP.

# Setup

* Clone the repo
   ```sh
   git clone https://github.com/priyanka-maz/Weather360
   ```

* Make sure MySQL is installed. We assume user:'root', password:'abcd'.

* Make sure Apache Tomcat 9.0.x is installed.

## Using Eclipse

1. Import project into Eclipse.

2. Setup tomcat server on any available port (say, 8080).

## Using jre directly (such as on a Linux VM on Azure)

1. Export WAR file from Eclipse.

2. Install tomcat-9.0.x server following instructions given at https://www.digitalocean.com/community/tutorial_collections/how-to-install-apache-tomcat

3. Navigate to tomcat manager and upload and deploy WAR file.

Navigate to /Startup to have the application automatically create the database and tables for you.

## Screenshots

![Index1](screenshots/index.png)
![Index2](screenshots/index2.png)
![Loc](screenshots/loc.png)
![Wttr](screenshots/wttr.png)
![Register](screenshots/register.png)
![Login](screenshots/login.png)
![Profile](screenshots/profile.png)
![Posts](screenshots/posts.png)
![Deleted](screenshots/deleted.png)
![Upload](screenshots/upload.png)
![Success](screenshots/success.png)
![Post](screenshots/post.png)
![Tags](screenshots/tags.png)
![Faq](screenshots/faq.png)
![About](screenshots/about.png)
![Error](screenshots/error.png)

## Features

- User Registration and Session Cookie based authentication for login.
- Passwords are stored using Bcrypt Hashing Algorithm.
- Users may logout.
- Users may specify their default location for displaying of weather news.
- Users may post articles with images and tags.
- Users may delete their own posts.
- Latest 6 posts can be viewed from the front page; others may be navigated using the posts link.
- Users can view wether information for any location of their choice.
- Users can listen to a TTS version of posts using Azure's Speech Service.

## File Structure

```
.
├── LICENSE .................................................... License terms
├── README.md .................................................. This document
└── Weather News
    ├── build
    │   └── classes
    │       └── pkg ............................................ Compiled Java classes
    └── src
        └── main
            ├── java
            │   └── pkg ........................................ Java Servlet sources
            └── webapp ......................................... HTML and JSP templates
                ├── META-INF
                │   └── MANIFEST.MF ............................ JAR manifest
                ├── other
                │   ├── css .................................... Font and CSS rules
                │   └── js ..................................... JS files
                ├── Pics ....................................... Static and Uploaded images
                └── WEB-INF
                    ├── lib
                    │   └── mysql-connector-java-8.0.30.jar .... MySQL connector JAR
                    └── web.xml ................................ Listing of servlet welcome files
```