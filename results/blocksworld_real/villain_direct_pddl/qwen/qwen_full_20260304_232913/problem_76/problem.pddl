(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        block_red - block
        block_purple - block
        block_yellow - block
        block_green - block
        block_orange - block
        block_blue - block
        robot1 - robot
    )
    (:init
        (ontable block_red)
        (ontable block_purple)
        (ontable block_yellow)
        (ontable block_green)
        (ontable block_orange)
        (ontable block_blue)
        (clear block_red)
        (clear block_purple)
        (clear block_yellow)
        (clear block_green)
        (clear block_orange)
        (clear block_blue)
        (handempty robot1)
    )
    (:goal (and
        (on block_red block_purple)
        (on block_yellow block_green)
        (on block_green block_orange)
        (on block_orange block_blue)
        (clear block_red)
        (clear block_yellow)
    ))
)