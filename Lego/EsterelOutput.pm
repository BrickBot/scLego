# Esterel output signal
#----------------------
package EsterelOutput;
require EsterelSignal;
@ISA = (EsterelSignal);
sub new {
  # args: name type
  my $proto = shift;
  my $self = EsterelSignal->new(@_);
  bless $self, $proto
}

sub FunctionName {
  my $self = shift;
  return $self->ModuleName() . '_O_' . $self->Name();
}

sub PrintCode {
  my $self = shift;
  local(*OUT) = shift;
  my $lego_api = lc $self->Name();
  my $fnc = $self->FunctionName();
  my $type = $self->Type();
  print OUT <<C_CODE;
int $fnc(val)
$type val;
{
  $lego_api(val);
  return 0;
}

C_CODE
  ;
}
1;
