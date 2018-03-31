: isOdd ( n -- bool)
    2 % 
;

: isPrime ( n -- bool )
    1 swap
    repeat 
        swap 1 + dup rot dup rot % not 
    until 
    = 
; 

: save ( val -- addr )
    8 allot dup rot swap ! 
;

: concat ( addr1 addr2 -- addr3 )
    swap 2dup
    count swap count dup rot +
    heap-alloc
    rot dup rot dup rot 
    string-copy swap 
    heap-free 
    dup rot + rot dup rot swap 
    string-copy 
    heap-free 
;

: collatz ( prints Collatz sequence to stdout )
repeat 
    dup 1 = not 
    if 
        dup 2 % 
        if 
            3 * 1 + dup . cr 0 
        else 
            2 / dup . cr 0 
        then 
    then 
until ;

