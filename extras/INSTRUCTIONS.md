First run `bundle exec rake passwords:get_all` at the root of the project to get all the users passwords.

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
