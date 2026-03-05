(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        block_blue - block
        block_red - block
        block_green - block
        block_yellow - block
        block_orange - block
        block_purple - block
        robot1 - robot
    )
    (:init
        (on block_blue block_red)
        (on block_red block_orange)
        (on block_orange block_purple)
        (on block_purple block_green)
        (on block_green block_yellow)
        (ontable block_yellow)
        (clear block_blue)
        (handempty robot1)
    )
    (:goal (and
        (on block_red block_blue)
        (on block_blue block_green)
        (on block_green block_yellow)
        (on block_yellow block_orange)
        (on block_orange block_purple)
        (ontable block_purple)
        (clear block_red)
    ))
)