(define (problem cooking) 
(:domain cooking) 
(:objects
    carrot
    tomato
    bowl
) 
(:init
    (on_table carrot)
    (on_table tomato)
    (clear carrot)
    (clear tomato)
    (clear bowl)
) 
(:goal (and 
    (in_bowl carrot)
    (sliced carrot)
    (in_bowl tomato)
    (sliced tomato)
)) 
)