( General utilities, not written to be used with any one specific problem )

: gcd
  begin
    2dup mod rot drop
    dup 0<> while
  repeat drop ;
      

: lcm 2dup * -rot gcd / ;
