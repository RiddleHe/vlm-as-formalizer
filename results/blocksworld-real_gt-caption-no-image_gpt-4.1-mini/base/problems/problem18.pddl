(define (problem stackblocks)
    (:domain blocksworld)
    (:objects
        purple red green yellow orange blue - block
        robot1 - robot
    )
    (:init
        (handempty robot1)

        (clear purple)
        (on purple red)
        (on red purple) ; invalid, remove later

        (ontable red)

        (clear green)
        (ontable green)

        (clear yellow)
        (on yellow orange)
        (on orange blue)
        (ontable blue)

        ; Fix init based on caption:

        (clear purple)
        (on purple red)
        (ontable red)

        (clear green)
        (ontable green)

        (clear yellow)
        (on yellow orange)
        (on orange blue)
        (ontable blue)
    )
    (:goal (and
        (on green purple)
        (on purple orange)
        (on orange yellow)
        (on yellow blue)
        (on blue red)
    ))
)