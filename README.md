NOTE: See https://twitter.com/SaraMG/status/282151648237858817

```
git clone https://github.com/patcon/vagrant-hiphop-drupal.git
cd vagrant-hiphop-drupal
gem install bundler
bundle install
bundle exec librarian-chef install
bundle exec vagrant up
```

Still testing, but the idea is to use the patch against Drupal 7.4 which supposedly already works, at least with an older version of hiphop-php. If it works, then we can try to move forward and troubleshoot the setbacks. Would be great to submit some Drupal core patches that would get vanilla drupal core working with hiphop-php...

http://php.webtutor.pl/en/2011/06/30/drupal-hh7-project-hiphop-for-php-and-drupal-7-4-compatibility-patch/
