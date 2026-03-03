(define (problem blocksworld)    (:domain blocksworld)    (:objects
        blue_block - block
        green_block - block
        red_block - block
        yellow_block - block
        orange_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (ontable blue_block)
        (ontable green_block)
        (ontable red_block)
        (ontable yellow_block)
        (clear blue_block)
        (clear green_block)
        (clear red_block)
        (clear yellow_block)
        (clear purple_block)
        (handempty robot_arm)
    )
    (:goal (and 
  (on yellow_block orange_block)
  (on orange_block red_block)
  (on red_block purple_block)
  (on blue_block green_block)
)))
