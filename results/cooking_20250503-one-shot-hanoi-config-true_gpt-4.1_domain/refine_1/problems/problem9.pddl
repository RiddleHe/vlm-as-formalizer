(define (problem cook-slice-place)
(:domain cooking)
(:objects
    robot1 robot2 - robot
    carrot cucumber1 cucumber2 - vegetable
    sliced_carrot sliced_cucumber1 sliced_cucumber2 - sliced_vegetable
    knife - tool
    bowl - object
    cuttingboard counter - location
)
(:init
    (at carrot counter)
    (at cucumber1 cuttingboard)
    (at cucumber2 cuttingboard)
    (at knife cuttingboard)
    (is-bowl bowl)
    (is-knife knife)
    (at bowl counter)
    (handempty robot1)
    (holding robot2 knife)
    (available robot1)
    (available robot2)
    (exists carrot)
    (exists cucumber1)
    (exists cucumber2)
    (exists sliced_carrot)
    (exists sliced_cucumber1)
    (exists sliced_cucumber2)
    (corresponds sliced_carrot carrot)
    (corresponds sliced_cucumber1 cucumber1)
    (corresponds sliced_cucumber2 cucumber2)
)
(:goal (and 
    (sliced carrot)
    (sliced cucumber1)
    (sliced cucumber2)
    (in-bowl sliced_carrot)
    (in-bowl sliced_cucumber1)
    (in-bowl sliced_cucumber2)
))
)