(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects 
        green orange purple blue red yellow - block
        robot1 - robot
    )
    (:init
        (ontable green)
        (ontable orange)
        (ontable purple)
        (ontable blue)
        (ontable red)
        (ontable yellow)
        (clear green)
        (clear orange)
        (clear purple)
        (clear blue)
        (clear red)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on green red)
        (on red purple)
        (on purple blue)
        (on blue orange)
        (on orange yellow)
    ))
)