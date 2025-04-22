(define (problem cooking) 
(:domain cooking) 
(:objects
    cucumber
    carrot
    tomato
) 
(:init
    (available cucumber)
    (available carrot)
    (available tomato)
    (not sliced cucumber)
    (not sliced carrot)
    (not sliced tomato)
) 
(:goal (and 
    (in-bowl cucumber)
    (in-bowl carrot)
    (in-bowl tomato)
    (sliced cucumber)
    (sliced carrot)
    (sliced tomato)
)) 
)