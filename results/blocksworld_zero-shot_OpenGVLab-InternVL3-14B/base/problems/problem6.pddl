(define (problem stack_blocks)
    (:domain blocksworld)
    (:objects
        robot - robot        ; Define the type of the robot
        purple_block - block
        pink_block - block
        orange_block - block
        yellow_block - block
    )
    (:init
        (ontable purple_block)
        (clear purple_block)
        (ontable pink_block)
        (clear pink_block)
        (ontable orange_block)
        (clear orange_block)
        (ontable yellow_block)  ; Corrected the initial state of yellow block
        (clear yellow_block)
        (handempty robot)      ; Corrected the initial state of the robot
    )
    (:goal (and
        (on pink_block purple_block)
        (on yellow_block orange_block)
    ))
)