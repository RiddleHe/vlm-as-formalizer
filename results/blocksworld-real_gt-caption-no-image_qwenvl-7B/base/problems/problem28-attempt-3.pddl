(define (problem blocksworld4)
    (:domain blocksworld)
    (:objects
        robot1 - robot
        table - block
        green1 - block
        blue1 - block
        orange1 - block
        yellow1 - block
        red1 - block
        purple1 - block
    )
    (:init
        (clear green1)
        (clear blue1)
        (clear orange1)
        (clear yellow1)
        (clear red1)
        (clear purple1)
        (ontable green1)
        (ontable blue1)
        (ontable orange1)
        (ontable yellow1)
        (ontable red1)
        (ontable purple1)
        (handempty robot1)
    )
    (:goal
        (and
            (on orange1 yellow1)
            (on yellow1 green1)
            (on green1 purple1)
            (on purple1 red1)
            (on red1 blue1)
            (clear orange1)
            (clear yellow1)
            (clear green1)
            (clear purple1)
            (clear red1)
            (clear blue1)
            (handempty robot1)
        )
    )
)