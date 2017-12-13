# Security vulnerabilities

This is a very insecure webapp example designed to show some classic vulnerabilities

## Instalation

Run `bundle install`

Then `bundle exec rake db:create db:migrate db:seed`


Finally run `rails s` to start the server

## Vulnerabilities examples

### OS command injection

For this attack go to [http://localhost:3000/os_injection](http://localhost:3000/os_injection)

This page receives a `command` query param and basically makes an eval of it and show the results. There is an example present there that sends an `ls` command to the server, for this it sends a `%60ls%60`. The `%60` is the ASCII HTML encoding of the character \` which, in Ruby, is used to call shell commands.

### SQL Injection

For this attack go to [http://localhost:3000/posts/1](http://localhost:3000/posts/1)

This page will basically add the ID of the post to the SQL query, so you can send whatever you want. The example given is using `1')%20OR%20('1'%20=%20'1?` as the Post ID, in other words: `posts WHERE id = 1 OR 1 = 1`.

### XSS (Cross-site scripting)

For this attack go to [http://localhost:3000/posts/3](http://localhost:3000/posts/3)

In this page we are letting Rails render the body of the post as raw string. Note that in Rails this is done explicitly, by default it does not render strings unscaped. In the example we are executing the classic alert XSS `<script>alert("This is an XSS example");</script>`, but you can execute whatever script you want.

There is another attack in [http://localhost:3000/posts/2](http://localhost:3000/posts/2), which loads an external js that takes advantage that the site has JQuery.

### Weak password storage

This site stores the MD5 hashes of the user passwords, this is a very poor solution. In order to explot this, there is a task that stores the passwords in a file, execute: `bundle exec rake passwords:get_all` at the root of the project to get all the users passwords.

Then download and install John the Ripper

```
wget http://www.openwall.com/john/j/john-1.8.0-jumbo-1.tar.xz
tar xf john-1.8.0-jumbo-1.tar.xz
sudo apt-get install libssl-dev
```

There is an extracted version already in the project, anyways you have to compile it

```
cd john-1.8.0-jumbo-1/src && ./configure && make clean && make
```

And now we are ready to crack some passwords!

```
cd ../run
./john --format=raw-MD5 --fork=8 --incremental ../../passwords.txt
```

Then you can check results:

```
./john --show ../../passwords.txt
```

## References

* [ASCII HTML URL encoding](https://www.w3schools.com/tags/ref_urlencode.asp)
