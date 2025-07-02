(define (problem blocksworld_problem_corrected)
    (:domain blocksworld)
    (:objects
        blue_block - block
        orange_block - block
        green_block - block
        purple_block - block
        red_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        ; Initial block states as per image interpretation
        (ontable blue_block)
        (ontable yellow_block)
        (ontable purple_block)
        (on green_block red_block)  ; As observed in the image
        (on orange_block green_block)
        (clear blue_block)
        (clear purple_block)
        (clear yellow_block)
        (not (clear orange_block))
        (not (clear red_block))
        ; Initial state for robot
        (handempty robot1)
    )
    (:goal
        (and
            (on blue_block orange_block)
            (on orange_block green_block)
            (on green_block purple_block)
            (on purple_block red_block)
            (on red_block yellow_block)
            (clear blue_block) ; Ensuring blue is on top, as required by the instruction
        )
    )
)