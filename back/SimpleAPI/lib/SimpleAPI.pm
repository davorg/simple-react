package SimpleAPI;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'SimpleAPI' };
};

true;
