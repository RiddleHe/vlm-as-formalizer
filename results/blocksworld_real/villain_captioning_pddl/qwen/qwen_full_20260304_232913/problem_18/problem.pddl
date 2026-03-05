(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        red_block - block
        orange_block - block
        purple_block - block
        green_block - block
        blue_block - block
        yellow_block - block
        robot1 - robot
    )
    (:init
        ; Left stack: purple on orange
        (on purple_block orange_block)
        (ontable orange_block)
        (clear purple_block)
        
        ; Middle: green block alone
        (ontable green_block)
        (clear green_block)
        
        ; Right stack: yellow on orange on blue
        (on yellow_block orange_block)
        (on orange_block blue_block)
        (ontable blue_block)
        (clear yellow_block)
        
        ; Red block is not visible but must be introduced; assume it's on table and clear
        (ontable red_block)
        (clear red_block)
        
        ; Robot is handempty
        (handempty robot1)
    )
    (:goal (and
        (on green_block purple_block)
        (on purple_block orange_block)
        (on orange_block yellow_block)
        (on yellow_block blue_block)
        (on blue_block red_block)
        (ontable red_block)
        (clear green_block)
    ))
)