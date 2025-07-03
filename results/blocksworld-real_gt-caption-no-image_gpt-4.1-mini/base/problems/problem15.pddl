(define (problem blocks_stack_rearrange)
    (:domain blocksworld)
    (:objects
        green yellow red blue purple orange - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (on yellow green)
        (on red yellow)
        (on blue red)
        (on purple blue)
        (on orange purple)
        (clear orange)
        (handempty robot1)
    )
    (:goal (and
        (on yellow blue)
        (on blue purple)
        (on purple orange)
        (on orange green)
        (on green red)
    ))
)