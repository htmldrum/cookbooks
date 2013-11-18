cookbooks
=========

Developer access to MShanken's Infrastructure Environments

Each repo is required to pass basic sanitation checks on the following environments:

+ Development - Development is the environment required to launch the application on an application developer's machine
+ Staging - Staging will check out the last stable commit of your project to preview it before going into production
+ Production - Production is the live environment for the application, interacting with all other network services specified

Application Developers access MShanken's DevOps resources using the following files, placed in the route of each repository:

+ .custom.json - Custom JSON is a programatic way to access our inventory of cookbooks available to stacks. Include your environment dependencies here.
+ .jenkins.json - _Not implemented_. In the future, developers will be able to communicate with MShanken's job scheduler and automated build system through configuration in .jenkins.json
