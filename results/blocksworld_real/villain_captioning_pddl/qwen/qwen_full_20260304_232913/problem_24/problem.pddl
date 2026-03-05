(define (problem blocksworld_goal1)
    (:domain blocksworld)
    (:objects
        block-purple - block
        block-blue - block
        block-green - block
        block-orange - block
        block-red - block
        block-yellow - block
        robot - robot
    )
    (:init
        (on block-purple block-blue)
        (on block-blue block-green)
        (on block-yellow block-red)
        (ontable block-green)
        (ontable block-orange)
        (ontable block-red)
        (clear block-purple)
        (clear block-orange)
        (clear block-yellow)
        (handempty robot)
    )
    (:goal (and
        (on block-blue block-orange)
        (on block-orange block-green)
        (on block-green block-purple)
        (on block-purple block-red)
        (on block-red block-yellow)
        (ontable block-yellow)
        (clear block-blue)
    ))
)