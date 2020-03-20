# Specialized output for light threshhold
package LightOutput;
require EsterelOutput;

@ISA = (EsterelOutput);
sub new {
  # args: name type index
  my $proto = shift;
  my $self = EsterelOutput->new(@_[0..1]);
  $self->{INDEX} = $_[2];
  bless $self, $proto
}

sub ThreshholdIndex {
  my $self = shift;
  return $self->{INDEX};
}

sub PrintCode {
  my $self = shift;
  local(*OUT) = shift;
  my $fnc = $self->FunctionName();
  my $type = $self->Type();
  my $index = $self->ThreshholdIndex();

  print OUT <<C_CODE;
int $fnc(val)
$type val;
{
  LIGHT_THRESHHOLD[$index] = val;
  return 0;
}

C_CODE
  ;
}
1;
