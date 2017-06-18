# JS-Jenkins-Papaya-Box

## Table Of Contents:

* [The Requirements](#the-requirements)
* [The Process](#the-process)
* [Troubleshooting](#troubleshooting)
* [General Information](#general-information)
* [Thanks to](#thanks-to)


## The Requirements

You thought that was a Download And Analyze (DAA) project, **but** you are mistaken! To run the PHP: HP: HP: HP-Jenkins-Breakfast-Box we need to install dependencies:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * Make sure to download the latest version, even if you already installed VirtualBox before.
  * Utilized v5.1.14
* [Vagrant](https://www.vagrantup.com/downloads.html)
  * Utilized v1.9.5
* [A Computer](https://giphy.com/gifs/7yDthHaq2haXS/html5)

## The Process

To run the papaya box go to your terminal, clone the repo, and run **vagrant up**:

```shell
$ git clone https://github.com/fufu70/JS-Jenkins-Papaya-Box
$ vagrant up
```

After the Vagrant machine starts for the first time it will task you with the next operation:

```shell
==> js-jenkins-papaya-box: You Installed the JS-Jenkins-Papaya-Box ... YAY! Run 'vagrant ssh', and 'sudo bash ~/install-jenkins/install.sh'
```

[Show me what you got](https://giphy.com/gifs/26DOs997h6fgsCthu/html5)

```shell
$ vagrant ssh
$ sudo bash ~/install-jenkins/install.sh
```

![alt text][unlock-jenkins]

Lets get [squanchy!](https://giphy.com/gifs/9hq4oGpaDkRqg/html5) By getting the Administrator password:

```shell
$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy and paste the password shown after the command is run.

You then come up to a screen that requests you to Customize Jenkins, choose the highlighted "Install suggested plugins" option
![alt text][customize-jenkins]

Afterwards it will install a list of generalized selection of plugins
![alt text][plugins-installing-jenkins]

Once the plugins are installed create the [*BUUUUURPH!*](https://giphy.com/gifs/etNSgwUJ79zZC/html5) admin user. Don't forget the username and password, we'll need it later.
![alt text][admin-user-jenkins]

Are we dont with installation? [Yes!](https://giphy.com/gifs/2LJESqgAzcASc/html5)
![alt text][installed-jenkins]

Jenkins is now installed, but we need to setup our server environment by adding some JavaScript tools.

```shell
$ sudo bash ~/install-jenkins/js-tools.sh
```

Then install the plugins for the php tools. You will need a username and password for jenkins as it connects to the JS-Jenkins-Papaya-Box through a **jenkins-cli.jar**.

```shell
$ sudo bash ~/install-jenkins/plugins.sh
```

Once the plugins have been installed we want to actually create a [job!](http://i.giphy.com/RBDXLadJCxs6A.gif) Don't forget that username and password.

```shell
$ sudo bash ~/install-jenkins/integration.sh
```

When running this command you'll be given an option to input a personal repository. If **N** is selected then the repository URL can be changed from the config section of the jenkins job at [http://192.168.205.40:8080/job/JS-DOM-Library/configure](http://192.168.205.40:8080/job/JS-DOM-Library/configure). The second option below is the **Source Code Management** config, here you can set a repository url and credentials:

![alt text][integrate-repo-jenkins]

## Troubleshooting

### Content Security Policy Issues

Okay my fellow [scrubs](http://i.giphy.com/YjJZKbm2kNN7i.gif)! The Jenkins job has been run, you go to your Plato html reports at [http://192.168.205.40:8080/job/JS-DOM-Library/ws/build/reports/index.html](http://192.168.205.40:8080/job/JS-DOM-Library/ws/build/reports/index.html). [Whats this!](http://i.giphy.com/ToMjGpnXBTw7vnokxhu.gif)

![alt text][blocked-font-plato]

What are all these console errors!

![alt text][blocked-script-console-errors]

This is a direct issue with the [Content Security Policy](https://wiki.jenkins-ci.org/display/JENKINS/Configuring+Content+Security+Policy) issue. Were going to run a script inside of Jenkins internal console. Go to [http://192.168.205.40:8080/script](http://192.168.205.40:8080/script) and run:

```groovy
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "")
```

Inside of the script console.

![alt text][script-console-execution]

After running the script go back to the CCCHR page at [http://192.168.205.40:8080/job/JS-DOM-Library/ws/build/reports/index.html](http://192.168.205.40:8080/job/JS-DOM-Library/ws/build/reports/index.html), hard refresh the page to clear your current [cache](http://i.giphy.com/VkYOrBIQv520M.gif), and view the splendor of no Content Security!

![alt text][unblocked-font-plato]

## General Information

A basic jenkins environment for JavaScript codebases strictly for ubuntu-16.04. Its not fully automatic but is an aid in starting up the project simply using shell scripts as a guide.

The default repository for the job is the [JS-DOM-Library](https://github.com/fufu70/JS-DOM-Library) project. It is a good aid in testing the JS-Jenkins-Papaya-Box.

## Thanks to:

Ariya Hidayat for the [PhantomJS project](https://twitter.com/AriyaHidayat)

[Vape Nation](https://giphy.com/gifs/11kucMKnMub8Q/html5)

[unlock-jenkins]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/unlock-jenkins.png "Unlock Jenkins"
[customize-jenkins]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/customize-jenkins.png "Customize Jenkins"
[plugins-installing-jenkins]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/plugins-installing-jenkins.png "Plugins Installing"
[admin-user-jenkins]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/admin-user-jenkins.png "Admin User Creation"
[installed-jenkins]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/installed-jenkins.png "Jenkins is installed"
[integrate-repo-jenkins]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/integrate-repo-jenkins.png "Integrate repository inside of Jenkins job"

[blocked-font-plato]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/blocked-font-plato.png "Blocked Font at Plato HTML page"
[blocked-script-console-errors]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/blocked-script-console-errors.png "Blocked Script Console Errors"
[script-console-execution]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/script-console-execution.png "Fix blocked script execution."
[unblocked-font-plato]: https://raw.githubusercontent.com/fufu70/JS-Jenkins-Papaya-Box/master/common/unblocked-font-plato.png "Fixed blocked font."