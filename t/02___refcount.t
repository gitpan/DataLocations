#!perl -w

use strict;
no strict "vars";

use Data::Locations;

# ======================================================================
#   $toplocation = Data::Locations->new();
#   $sublocation = $location->new();
#   $refs = $location->_mortalize_();
#   $location->_resurrect_($refs);
# ======================================================================

print "1..40\n";

$n = 1;

no strict "refs";
$loc = \*{'Data::Locations::LOCATION'};
use strict "refs";
bless($loc, 'Data::Locations');

&check($loc,1);

tie(*{$loc}, 'Data::Locations', $loc);

&check($loc,2);

${*{$loc}} = $loc;

&check($loc,3);

delete $Data::Locations::{'LOCATION'};

&check($loc,2);

$top = Data::Locations->new();

&check($top,0);

$sub = $top->new();

&check($top,0);

&check($sub,1);

@{*{$top}} = ();

&check($top,0);

&check($sub,0);

if (${*{$top}}{'refs'} == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

if (${*{$sub}}{'refs'} == 3)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

no strict "refs";
$fake = \${'Data::Locations::LOCATION'};
use strict "refs";
bless($fake, 'Data::Locations');

eval { $refs = $fake->_mortalize_(); };
if ($@ =~ /Data::Locations::_mortalize_\(\): item is not a "Data::Locations" object/)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

eval { $fake->_resurrect_($refs); };
if ($@ =~ /Data::Locations::_resurrect_\(\): item is not a "Data::Locations" object/)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

exit;

sub check
{
    my($obj,$refs) = @_;
    my($test1,$test2);

    $refs++;
    $test1 = &Data::Locations::_mortalize_($obj);
    if ($test1 == $refs)
    {print "ok $n\n";} else {print "not ok $n\n";}
    $n++;

    if ($obj->_mortalize_() == 0)
    {print "ok $n\n";} else {print "not ok $n\n";}
    $n++;

    &Data::Locations::_resurrect_($obj,$test1);

    $test2 = &Data::Locations::_mortalize_($obj);
    if ($test2 == $refs)
    {print "ok $n\n";} else {print "not ok $n\n";}
    $n++;

    if ($obj->_mortalize_() == 0)
    {print "ok $n\n";} else {print "not ok $n\n";}
    $n++;

    $obj->_resurrect_($test2);
}

__END__

