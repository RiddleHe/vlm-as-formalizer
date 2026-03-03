(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        blue_block - block
        purple_block - block
        orange_block - block
        red_block - block
        yellow_block - block
        robot_arm - robot
    )
    (:init
        (on purple_block orange_block)
        (ontable green_block)
        (ontable blue_block)
        (ontable purple_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable yellow_block)
        (clear green_block)
        (clear blue_block)
        (clear purple_block)
        (clear red_block)
        (clear yellow_block)
        (handempty robot_arm)
    )
    (:goal (and
  (on orange_block yellow_block)
  (on green_block blue_block)
  (on red_block purple_block)
)))
