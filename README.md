# Vagrant

https://www.vagrantup.com/

## Vagrant PHP XDebug SublimeText

http://mattwatson.codes/debug-php-vagrant-using-xdebug-sublime-text/

##Install

Configure ```test.sublime-project``` file:

"/home/username/workspace/vagrant/test": is the absolute path where is located the project files

```
"path_mapping": {
                 "/vagrant" : "/home/username/workspace/vagrant/test",
            },
            "url": "http://localhost:4567/",
```

```
$ vagrant up
```

