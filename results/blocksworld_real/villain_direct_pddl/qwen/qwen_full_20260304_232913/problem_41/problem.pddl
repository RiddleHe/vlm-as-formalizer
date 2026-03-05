(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        block_orange - block
        block_purple - block
        block_green - block
        block_blue - block
        block_yellow - block
        block_red - block
        robot1 - robot
    )
    (:init
        (ontable block_orange)
        (ontable block_blue)
        (ontable block_red)
        (ontable block_yellow)
        (on block_green block_red)
        (on block_purple block_green)
        (clear block_orange)
        (clear block_blue)
        (clear block_yellow)
        (clear block_purple)
        (handempty robot1)
    )
    (:goal (and
        (on block_orange block_purple)
        (on block_green block_blue)
        (on block_yellow block_red)
    ))
)