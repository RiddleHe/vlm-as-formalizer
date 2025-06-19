(define (problem blocksworld-task)
    (:domain blocksworld)
    (:objects
        yellow orange red green blue purple - block
        robot1 - robot
    )
    (:init
        ;; Current state assumptions from the images:
        ;; orange block is on the table and clear
        (ontable orange)
        (clear orange)

        ;; yellow and red, green, blue, purple blocks currently on table and clear or stacked:
        (ontable yellow)
        (clear yellow)
        (ontable red)
        (clear red)
        (ontable green)
        (clear green)
        (ontable blue)
        (clear blue)
        (ontable purple)
        (clear purple)

        (handempty robot1)
    )
    (:goal (and
        (on yellow orange)
        (on red green)
        (on blue purple)
    ))
)