(define (problem blocksworld_problem_correct)
    (:domain blocksworld)
    (:objects
        purple_block - block
        pink_block - block
        yellow_block - block
        orange_block - block
        red_block - block
        green_block - block  ; Included based on common block colors; adjust as necessary
        robot1 - robot
    )
    (:init
        (clear yellow_block)
        (ontable red_block)
        (ontable orange_block)
        (ontable pink_block)
        (ontable yellow_block)
        (on purple_block pink_block)
        (on red_block orange_block)
        (handempty robot1)
    )
    (:goal (and
        (on pink_block purple_block)
        (clear pink_block)
        (on yellow_block orange_block)
        (clear yellow_block)
        (ontable red_block)
    ))
)