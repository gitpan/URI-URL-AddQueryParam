use strict;
use warnings;
use URI::URL::AddQueryParam qw(http_add_query_param);
use Test::More tests => 5;

my %http_param;
my $base_url;

%http_param = ('ta' => 'ok');
$base_url = 'http://example.com/123.php';
is( http_add_query_param($base_url, \%http_param), 'http://example.com/123.php?ta=ok');

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com';
is( http_add_query_param($base_url, \%http_param), 'http://example.com/?ta=ok&hoge=0&foobar=1' );

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com/';
is( http_add_query_param($base_url, \%http_param), 'http://example.com/?ta=ok&hoge=0&foobar=1' );

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com?soso=gogo';
is( http_add_query_param($base_url, \%http_param), 'http://example.com?soso=gogo&ta=ok&hoge=0&foobar=1' );

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com/tt3.php?soso=gogo';
is( http_add_query_param($base_url, \%http_param), 'http://example.com/tt3.php?soso=gogo&ta=ok&hoge=0&foobar=1' );
