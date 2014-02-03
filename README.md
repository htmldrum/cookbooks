cookbooks
=========
Developer access to MShanken's Infrastructure Environments. Company-wide, MShanken utilises Chef to provision virtual environments.

Each repo is required to pass basic sanitation checks on the following environments:

+ Development - Development is the environment required to launch the application on an application developer's machine
+ Staging - Staging will check out the last stable commit of your project to preview it before going into production
+ Production - Production is the live environment for the application, interacting with all other network services specified

Application Developers access MShanken's DevOps resources using the following files, placed in the route of each repository:

+ .custom.json - Custom JSON is a programatic way to access our inventory of cookbooks available to stacks. Include your environment dependencies here.
+ .jenkins.json - _Not implemented_. In the future, developers will be able to communicate with MShanken's job scheduler and automated build system through configuration in .jenkins.json

Further, 3 'cookbooks' are used to configure mshanken resources company-wide:

  + mshanken-data_bags
  + mshanken-environments
  + mshanken-roles

Together these cookbooks provide for global Chef configurations.

Adding New Cookbooks
====================

If your cookbook is an application cookbook, you are required to Fork our
example cookbook in a new repository:

  + Check out the application: ``` git clone git@github.com:mshanken/mshanken-example-client.git $HOME/mshanken/$APPLICATION_NAME ```
  + Correct the new master branch:  ``` cd $HOME/mshanken/$APPLICATION_NAME; git checkout -b mshanken; git branch -d master; git checkout --orphan master ```
  + Correct the new origin: ``` git remote remove origin; git remote add origin $APPLICATION_GITHUB_ORIGIN; ```
  + Test Endpoint : ``` touch README.md; git add .; git commit -m "init"; git push -u origin master;``
  + Once Endpoint is tested, inform your nearest SysAdmin and they can add it to the mshanken software index ( git@github.com:mshanken/cookbooks.git )
