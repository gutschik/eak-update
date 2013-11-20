Ember App Kit Upgrade Script
============================

[Ember App Kit](https://github.com/stefanpenner/ember-app-kit/) probably the future of developing ember applications.
However, much work still needs to be done, and is updated constantly.

This bash script can help to quickly upgrade EAK in an existing project. It is by no means complete, but, for me
at least, is useful to have since I have a number of applications using EAK which I'd like to keep up to date.


Getting Started
===============

* Get the latest release ([tar.gz](https://github.com/stefanpenner/ember-app-kit/archive/master.tar.gz) or [zip](https://github.com/stefanpenner/ember-app-kit/archive/master.zip))
* Downoad eak-update.sh
* Extract the EAK release into a directory (the script assumes /tmp)
* Update the `APPDIR` variable in eak-update.sh to point to your application
* run `eak-update.sh`  (make sure its executable)

The script will patch your existing application, then upgrade the project for both node and bower dependencies.

Gotchas
=======

* The whole tasks directory will be overwritten, so make sure there is no custom code in there
* Sometimes the `app/app.js` file gets updated. Check that one manually to make sure its up to date
* Latest releases of EAK have an app/adapters directory. If you've got an old EAK, make sure the structure is consistent.
* The vendors directory should have a file called `loader.js`. If you have `almond.js` make sure you delete it and copy the loader.js file in manually. Make sure the `app/index.html` file is updated accordingly
* Ember-Data used to live in `vendors/ember-data-shim`. That has changed. Ensure your `app/index.html` points to the correct place.

