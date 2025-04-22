(define (problem cooking) 
(:domain cooking) 
(:objects
    tomato
    bowl
) 
(:init
    (on-board tomato)
    (clear tomato)
    (clear bowl)
    (has-knife)
) 
(:goal (and 
    (slice tomato)
    (in-bowl tomato)
)) 
)