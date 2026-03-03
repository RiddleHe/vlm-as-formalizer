(define (problem blocksworld)    (:domain blocksworld)    (:objects
        red_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on blue_block green_block)
        (ontable red_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable purple_block)
        (clear red_block)
        (clear yellow_block)
        (clear blue_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on blue_block orange_block)
    (on yellow_block green_block)
    (on green_block red_block)
    (on red_block purple_block)
  )
))
