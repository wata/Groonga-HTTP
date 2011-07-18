use inc::Module::Install;
name 'Groonga-HTTP';
all_from 'lib/Groonga/HTTP.pm';

requires 'URI'                   => 1.58;
requires 'Furl'                  => 0.32;
requires 'JSON'                  => 2.53;
requires 'Data::Dumper::Concise' => 2.020;

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
