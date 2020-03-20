# Esterel input signal for contact sensor
#----------------------------------------
package ContactInput;
require EsterelInput;
@ISA = (EsterelInput);
sub new {
  # args: input_name type Lego_sensor
  my $proto = shift;
  my $self = EsterelInput->new(@_);
  bless $self, $proto;
  return $self;
}

sub PrintCall {
  my $self = shift;
  local(*OUT) = shift;
  my $fnc = $self->FunctionName();
  my $sensor = $self->LegoSensor();
  print OUT <<C_CODE;
    if ( $sensor < 0xf000 ) {
      $fnc();
    }
C_CODE
  ;
}
1;
