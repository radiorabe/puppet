# Puppet Stack

[![Build Status](https://travis-ci.org/radiorabe/puppet.png?branch=feature/travis-integration)](https://travis-ci.org/radiorabe/puppet)

This is the puppet-3 stack that is being prepared for production @rabe.

This stack will replace the puppet-infra-project stack when it is final.

With this stack I plan on finally separating implementation logic from
business logic. I'll stick with classifying nodes in couchdb but start
reading parts of the values from the couch through hiera.

## Developers

Prepare stack for build:

```bash
gem install librarian-puppet
librarian-puppet install
```

Run link and spec on profiles and roles modules:

```bash
bundle
bundle exec rake lint
bundle exec rake spec
```
