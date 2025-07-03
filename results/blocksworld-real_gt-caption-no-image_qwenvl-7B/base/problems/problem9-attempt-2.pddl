(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        block1 - block
        block2 - block
        block3 - block
        block4 - block
        block5 - block
        block6 - block
        robot1 - robot
    )
    (:init
        (clear block1)
        (on block1 block2)
        (on block2 block3)
        (ontable block3)
        (clear block4)
        (on block4 block5)
        (on block5 block6)
        (ontable block6)
        (handempty robot1)
        (ontable robot1)
    )
    (:goal
        (and
            (on block3 block4)
            (on block1 block6)
            (on block5 block2)
        )
    )
)