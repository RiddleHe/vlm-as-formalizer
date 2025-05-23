(define (problem stack_blocks)
(:domain blocksworld)
(:objects 
    block_pink block_red block_yellow block_green
    robot1 - robot
)
(:init
    (ontable block_pink)
    (ontable block_red)
    (ontable block_yellow)
    (ontable block_green)
    (clear block_pink)
    (clear block_red)
    (clear block_yellow)
    (clear block_green)
    (handempty robot1)
)
(:goal (and
    (on block_pink block_red)
    (on block_red block_yellow)
    (on block_yellow block_green)
))
)