(define (problem blocksworld)    (:domain blocksworld)    (:objects
        green_block - block
        blue_block - block
        orange_block - block
        red_block - block
        yellow_block - block
        purple_block - block
        robot_arm - robot
    )
    (:init
        (on purple_block red_block)
        (on purple_block yellow_block)
        (ontable green_block)
        (ontable orange_block)
        (ontable red_block)
        (ontable purple_block)
        (clear green_block)
        (clear blue_block)
        (clear yellow_block)
        (clear purple_block)
    )
    (:goal (and
  (on orange_block purple_block)
  (on purple_block red_block)
  (on red_block blue_block)
  (on blue_block yellow_block)
  (on yellow_block green_block)
  (ontable green_block)
  (clear orange_block)
)))
