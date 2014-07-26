use strict;
use warnings;
use URI::URL::AddQueryParam qw(http_add_query_param);
use Test::More tests => 5;

my %http_param;
my $base_url;
my $result;

%http_param = ('ta' => 'ok');
$base_url = 'http://example.com/123.php';
is( http_add_query_param($base_url, \%http_param), 'http://example.com/123.php?ta=ok');

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com';
$result = http_add_query_param($base_url, \%http_param);
ok( $result eq 'http://example.com/?ta=ok&hoge=0&foobar=1' or $result eq 'http://example.com/?hoge=0&foobar=1&ta=ok' );

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com/';
$result = http_add_query_param($base_url, \%http_param);
ok( $result eq 'http://example.com/?ta=ok&hoge=0&foobar=1' or $result eq 'http://example.com/?foobar=1&ta=ok&hoge=0' );

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com?soso=gogo';
$result = http_add_query_param($base_url, \%http_param);
ok( $result eq 'http://example.com?soso=gogo&ta=ok&hoge=0&foobar=1' or $result eq 'http://example.com?soso=gogo&hoge=0&ta=ok&foobar=1' );

%http_param = ('ta' => 'ok', 'foobar' => 1, 'hoge' => 0);
$base_url = 'http://example.com/tt3.php?soso=gogo';
$result = http_add_query_param($base_url, \%http_param);
ok( $result eq 'http://example.com/tt3.php?soso=gogo&ta=ok&hoge=0&foobar=1' or $result eq 'http://example.com/tt3.php?soso=gogo&hoge=0&foobar=1&ta=ok' );
