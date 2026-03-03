(define (problem blocksworld)    (:domain blocksworld)    (:objects
        orange_block - block
        yellow_block - block
        green_block - block
        blue_block - block
        red_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (ontable orange_block)
        (ontable yellow_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable red_block)
        (ontable purple_block)
        (clear orange_block)
        (clear yellow_block)
        (clear green_block)
        (clear blue_block)
        (clear red_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and 
    (on blue_block green_block)
    (on red_block yellow_block)
    (on purple_block orange_block)
  )
))
