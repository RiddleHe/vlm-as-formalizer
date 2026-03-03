(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    yellow_block blue_block red_block orange_block purple_block green_block - block
    single_robot_arm - robot
  )
  (:init
    ;; table placements
    (ontable blue_block)
    (ontable red_block)
    (ontable orange_block)

    ;; stacking relations
    (on yellow_block blue_block)
    (on purple_block orange_block)
    (on green_block purple_block)

    ;; clear blocks
    (clear yellow_block)
    (clear red_block)
    (clear green_block)

    ;; robot state
    (handempty single_robot_arm)
  )
  (:goal
    (and
      ;; stack 1: purple over green over blue over yellow
      (on purple_block green_block)
      (on green_block blue_block)
      (on blue_block yellow_block)

      ;; stack 2: orange over red
      (on orange_block red_block)
    )
  )
)