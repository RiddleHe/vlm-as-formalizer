(define (problem two_stacks)
    (:domain blocksworld)
    (:objects
        red orange purple pink yellow green - block
        robot1 - robot
    )
    (:init
        (ontable red)
        (on red orange)
        (on orange purple)
        (on purple pink)
        (on pink yellow)
        (ontable green)
        (clear green)
        (clear yellow)
        (handempty robot1)
    )
    (:goal (and
        (on green yellow)
        (on yellow pink)
        (on pink red)
        (ontable red)
        (on purple orange)
        (on orange red)
        (ontable red)
    ))
)