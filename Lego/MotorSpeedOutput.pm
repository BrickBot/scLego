# Specialized output for motor speed
package MotorSpeedOutput;
require EsterelOutput;

@ISA = (EsterelOutput);
sub new {
  # args: name type
  my $proto = shift;
  my $self = EsterelOutput->new(@_);
  bless $self, $proto
}

sub PrintCode {
  my $self = shift;
  $self->SUPER::PrintCode(@_);
}
;
