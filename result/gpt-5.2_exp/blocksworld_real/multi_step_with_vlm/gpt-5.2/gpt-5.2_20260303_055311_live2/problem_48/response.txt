(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        purple_block - block
        orange_block - block
        robot_1 - robot
    )
    (:init
        (on red_block yellow_block)
        (on yellow_block green_block)
        (on blue_block orange_block)
        (on purple_block blue_block)
        (ontable green_block)
        (ontable orange_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot_1)
    )
    (:goal (and 
    (on blue_block purple_block)
    (on red_block yellow_block)
    (on green_block orange_block)
  )
))
