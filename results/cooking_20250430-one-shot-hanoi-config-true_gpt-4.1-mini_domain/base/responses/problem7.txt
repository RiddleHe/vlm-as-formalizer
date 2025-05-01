(define (problem slice-and-place-vegetables)
    (:domain cooking)
    (:objects
        robot1
        robot2
        knife
        cucumber - vegetable
        carrot - vegetable
        tomato - vegetable
        bowl
        table
    )
    (:init
        (is_vegetable cucumber)
        (is_vegetable carrot)
        (is_vegetable tomato)
        (is_tool knife)
        (is_bowl bowl)
        (at cucumber table)
        (at carrot table)
        (at tomato table)
        (at bowl table)
        (holding robot1 knife)
        (robot_holding_knife robot1)
    )
    (:goal (and
        (sliced cucumber)
        (sliced carrot)
        (sliced tomato)
        (at cucumber bowl)
        (at carrot bowl)
        (at tomato bowl)
    ))
)