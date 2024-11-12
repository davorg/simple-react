#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Dancer2;

# A before hook to add CORS headers to every response
hook before => sub {
    response_header 'Access-Control-Allow-Origin' => '*';
    response_header 'Access-Control-Allow-Methods' => 'GET, POST, OPTIONS';
    response_header 'Access-Control-Allow-Headers' => 'Content-Type';
};

# The API route
get '/api/items' => sub {
    content_type 'application/json';
    return to_json([
        { id => 1, name => "Item 1" },
        { id => 2, name => "Item 2" },
        { id => 3, name => "Item 3" },
    ]);
};

start;

