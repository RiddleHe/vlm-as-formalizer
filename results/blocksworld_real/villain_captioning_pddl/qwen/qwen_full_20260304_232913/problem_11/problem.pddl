(define (problem blocksworld_task)
    (:domain blocksworld)
    (:objects
        block_blue - block
        block_green - block
        block_orange - block
        block_purple - block
        block_red - block
        block_yellow - block
        robot_arm - robot
    )
    (:init
        (on block_purple block_yellow)
        (ontable block_yellow)
        (clear block_purple)
        (on block_blue block_orange)
        (on block_green block_blue)
        (ontable block_orange)
        (clear block_green)
        (ontable block_red)
        (clear block_red)
        (handempty robot_arm)
    )
    (:goal (and
        (on block_green block_blue)
        (on block_blue block_purple)
        (on block_purple block_orange)
        (ontable block_orange)
        (clear block_green)
        (on block_red block_yellow)
        (ontable block_yellow)
        (clear block_red)
    ))
)