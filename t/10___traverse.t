#!perl -w

use strict;
no strict "vars";

use Data::Locations;

# ======================================================================
#   $location->traverse(\&callback_function);
# ======================================================================

print "1..16\n";

$n = 1;

$loc1 = Data::Locations->new();

$loc1->print("[1]2>");
$loc2 = $loc1->new();
$loc1->print("<2[1]");

$loc2->print("[2]3>");
$loc3 = $loc2->new();
$loc2->print("<3[2]");

$loc3->print("[3]4>");
$loc4 = $loc3->new();
$loc3->print("<4[3]");

$loc4->print("[4]");

$loc1->print("[1]3>", $loc3, "<3[1]");
$loc1->print("[1]4>", $loc4, "<4[1]");

@text =
    (
        "[1]2>",
        "[2]3>",
        "[3]4>",
        "[4]",
        "<4[3]",
        "<3[2]",
        "<2[1]",
        "[1]3>",
        "[3]4>",
        "[4]",
        "<4[3]",
        "<3[1]",
        "[1]4>",
        "[4]",
        "<4[1]"
    );

$index = 0;

$loc1->traverse(\&compare);

if ($index == @text)
{print "ok $n\n";} else {print "not ok $n\n";}
$n++;

exit;

sub compare
{
    my($item) = @_;

    if ($item eq $text[$index++])
    {print "ok $n\n";} else {print "not ok $n\n";}
    $n++;
}

__END__

