: isOdd ( n -- bool)
    2 % 
;

: isPrime ( n -- bool )
    dup 2 < not if
    1 swap
        repeat 
            swap 1 + dup rot dup rot % not 
        until 
        = 
    else drop 0 then
; 

: save ( val -- addr )
    8 allot dup rot swap ! 
;

: concat ( addr1 addr2 -- addr3 )
    swap 2dup
    count swap count dup rot + 1 +
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

