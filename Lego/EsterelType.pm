package EsterelType;
require Exporter;

@ISA = qw(Exporter);

@EXPORT = (GetType);

my %Type = ('$0' => 'boolean',
	    '$1' => 'integer',
	    '$2' => 'string',
	    '$3' => 'float',
	    '$4' => 'double');

sub GetType {
  return (exists $Type{$_[0]} ? $Type{$_[0]} : "'$_[0]'");
}
1;
