(define (problem cook-slice-place)
    (:domain cooking)
    (:objects
        robot1 robot2 - robot
        carrot cucumber1 cucumber2 - vegetable
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
    )
    (:goal (and 
        (sliced carrot)
        (sliced cucumber1)
        (sliced cucumber2)
        (in-bowl carrot)
        (in-bowl cucumber1)
        (in-bowl cucumber2)
    ))
)