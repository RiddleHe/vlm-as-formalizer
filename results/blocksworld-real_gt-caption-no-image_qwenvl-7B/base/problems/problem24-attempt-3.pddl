(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        orange1 - block
        orange2 - block
        purple1 - block
        purple2 - block
        purple3 - block
        green1 - block
        green2 - block
        blue1 - block
        yellow1 - block
        red1 - block
        robot1 - robot
        table - block
    )
    (:init
        (clear orange1)
        (clear orange2)
        (clear purple1)
        (clear purple2)
        (clear purple3)
        (clear green1)
        (clear green2)
        (clear blue1)
        (clear yellow1)
        (clear red1)
        (ontable orange1)
        (ontable orange2)
        (ontable purple1)
        (ontable purple2)
        (ontable purple3)
        (ontable green1)
        (ontable green2)
        (ontable blue1)
        (ontable yellow1)
        (ontable red1)
        (handempty robot1)
    )
    (:goal
        (and
            (on blue1 orange1)
            (on orange1 green1)
            (on green1 purple1)
            (on purple1 purple2)
            (on purple2 purple3)
            (on purple3 red1)
            (on red1 yellow1)
            (clear blue1)
            (clear orange1)
            (clear green1)
            (clear purple1)
            (clear purple2)
            (clear purple3)
            (clear red1)
            (clear yellow1)
            (handempty robot1)
        )
    )
)