// File name: projects/02/Neg16.tst

load Neg16.hdl,
output-file Neg16.out,
compare-to Neg16.cmp,
output-list in%B1.16.1 out%B1.1.1;

set in %B0000000000000000,  // in = 0
eval,
output;

set in %B1111111111111111,  // in = -1
eval,
output;

set in %B0000000000000101,  // in = 5
eval,
output;

set in %B1111111111111011,  // in = -5
eval,
output;
