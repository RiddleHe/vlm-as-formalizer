(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue_block orange_block green_block red_block purple_block yellow_block - block
    robot_arm - robot
  )
  (:init
    ;; left stack
    (ontable green_block)
    (on orange_block green_block)
    (on blue_block orange_block)

    ;; right stack
    (ontable purple_block)
    (on red_block purple_block)

    ;; single block
    (ontable yellow_block)

    ;; clear blocks
    (clear blue_block)
    (clear red_block)
    (clear yellow_block)

    ;; robot state
    (handempty robot_arm)
  )
  (:goal
    (and
      ;; stack 1: green over red
      (on green_block red_block)

      ;; stack 2: blue over orange over purple over yellow
      (on blue_block orange_block)
      (on orange_block purple_block)
      (on purple_block yellow_block)
    )
  )
)