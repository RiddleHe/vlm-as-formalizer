(define (problem cooking) 
(:domain cooking) 
(:objects
    cucumber
    carrot
    bowl
    knife
) 
(:init
    (clear cucumber)
    (clear carrot)
    (clear bowl)
    (holding knife)
) 
(:goal (and 
    (in-bowl cucumber)
    (in-bowl carrot)
    (sliced cucumber)
    (sliced carrot)
)) 
)