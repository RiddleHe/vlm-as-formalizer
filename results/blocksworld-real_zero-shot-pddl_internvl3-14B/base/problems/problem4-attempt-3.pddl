(define (problem blocksworld_problem)
        (:domain blocksworld)
        (:objects
            green - block
            blue - block
            purple - block
            red - block
            orange - block
            yellow - block
            robot1 - robot
        )
        (:init
            (on purple red)
            (on red blue)
            (on blue green)
            (on orange yellow)
            (clear blue)
            (handempty robot1)
        )
        (:goal
            (and
                (on purple green)
                (on red purple)
                (on blue red)
                (on orange blue)
                (on yellow orange)
            )
        )
    )