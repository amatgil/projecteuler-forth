needs utils.fth

: PE1 ( -- S )
  \ sum_{i=0}^1000 {i if 3|x or 5|x}
  \ Stack: acc i
  0 0
  begin
    dup dup 3 MOD 0= swap 5 MOD 0= or if
      swap over + swap \ acc i <- acc+i i
    then
    1+
    dup 1000 < while
  repeat
  drop ;

: PE2 ( -- S )
  \ sum of even-valued fibonnaci numbers under 4e6
  \ Stack: acc a b
  0 0 1
  begin
    dup 2 mod 0= if \ if even
      rot over + -rot \ acc a b <- acc+b a b
    then
    swap over + \ advance fib scan
    dup 4000000 < while
  repeat
  drop drop ;

: PE5 1 20 1 do i lcm loop ;

: PE5-bad ( -- S )
  \ smallest number evenly divisible by 1..=10
  \ until 10 and not 20 because this too naïve
  1
  begin \ Stack: IsGood n
    true swap 10 1 do 
      dup i mod 0<> if swap drop false swap then
    loop swap invert while 1+
  repeat ;


: PE6 ( -- S )
  100 1+ { m }
  0 m 1 do i + loop dup * \ square of sums
  0 m 1 do i dup * + loop \ sum of squares
  - ;
  
: PE9
  \ only a*b*c st (a,b,c) a*a+b*b=c*c and a+b+c=100
  \ Stack: a b (c is computed)
  1000 { n }
  n 1 do
    n 1 do
      i i * j j * +
      s>f fsqrt fdup 1e0 fmod f0= if f>s
                                  else fdrop n n * negate \ garbage value
                                  then
      i j + + n = if
        i i * j j * + isqrt i j * *  unloop unloop exit
      then
    loop
  loop
;
