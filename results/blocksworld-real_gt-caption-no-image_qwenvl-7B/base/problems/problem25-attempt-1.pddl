(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - table
        blue1 - block
        blue2 - block
        orange1 - block
        orange2 - block
        yellow1 - block
        yellow2 - block
        yellow3 - block
        red1 - block
        red2 - block
        green1 - block
        green2 - block
        green3 - block
        purple1 - block
    )
    (:init
        (ontable blue1)
        (ontable blue2)
        (ontable orange1)
        (ontable orange2)
        (ontable yellow1)
        (ontable yellow2)
        (ontable yellow3)
        (ontable red1)
        (ontable red2)
        (ontable green1)
        (ontable green2)
        (ontable green3)
        (ontable purple1)
        (handempty robot1)
        (clear blue1)
        (clear blue2)
        (clear orange1)
        (clear orange2)
        (clear yellow1)
        (clear yellow2)
        (clear yellow3)
        (clear red1)
        (clear red2)
        (clear green1)
        (clear green2)
        (clear green3)
        (clear purple1)
    )
    (:goal
        (and
            (on orange1 red1)
            (on red1 yellow1)
            (on blue1 purple1)
            (on purple1 green1)
        )
    )
)