(define (problem cooking) 
(:domain cooking) 
(:objects
    cucumber
    tomato
    bowl
) 
(:init
    (clear cucumber)
    (clear tomato)
    (on_counter cucumber)
    (on_counter tomato)
) 
(:goal (and 
    (in_bowl cucumber)
    (in_bowl tomato)
    (sliced cucumber)
    (sliced tomato)
)) 
)