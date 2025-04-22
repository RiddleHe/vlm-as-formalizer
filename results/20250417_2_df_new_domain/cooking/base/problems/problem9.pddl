(define (problem cooking) 
(:domain cooking) 
(:objects
    carrot
    cucumber
    bowl
) 
(:init
    (on-table carrot)
    (on-table cucumber)
    (clear carrot)
    (clear cucumber)
    (clear bowl)
) 
(:goal (and 
    (in-bowl carrot)
    (in-bowl cucumber)
    (sliced carrot)
)) 
)