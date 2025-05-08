(define (problem cooking1)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife - tool
        cucumber carrot - vegetable
        bowl cutting_board counter - location
    )
    (:init
        (at bowl counter)
        (at cucumber counter)
        (at carrot counter)
        (at knife robot2)  ; robot2 is holding the knife
        (holding robot2 knife)
        (free robot1)
        (sharp knife)
        (on cucumber counter)
        (on carrot counter)
    )
    (:goal (and
        (sliced cucumber)
        (sliced carrot)
        (in cucumber bowl)
        (in carrot bowl)
    ))
)