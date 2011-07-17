use inc::Module::Install;
name 'Groonga-HTTP';
all_from 'lib/Groonga/HTTP.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
