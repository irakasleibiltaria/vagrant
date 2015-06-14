# Vagrant

https://www.vagrantup.com/

## Vagrant PHP XDebug SublimeText

http://mattwatson.codes/debug-php-vagrant-using-xdebug-sublime-text/

##Install

In Sublime Text by using the contextual menu to go to ```Project > Add Folder to Project```…

then, ```Project > Save Project As```… and save the project file in the root of your project folder

then, replace the content of the file ```.sublime.project```

```
{
    "folders":
    [
        {
        "follow_symlinks": true,
	    "path": "."
        }
    ],
    "settings": {
        "xdebug": {
	    "path_mapping": {
                 "/vagrant" : "/home/username/workspace/vagrant/test",
            },
            "url": "http://localhost:4567/",
            "super_globals": true,
            "close_on_stop": true
        }
    }
}
```
Note: "/home/username/workspace/vagrant/test": is the absolute path where is located the project files


Then Run:
```
$ vagrant up
```

Access to the web:
```
http://localhost:4567/phpinfo.php?XDEBUG_SESSION_START=sublime.xdebug
```

