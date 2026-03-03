(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block yellow_block green_block blue_block purple_block - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; table placements
    (ontable red_block)
    (ontable yellow_block)
    (ontable green_block)
    (ontable purple_block)

    ;; existing stack
    (on blue_block green_block)

    ;; clear conditions
    (clear blue_block)
    (clear red_block)
    (clear yellow_block)
    (clear purple_block)
    ;; green_block is not clear because blue_block is on it
  )
  (:goal
    (and
      ;; stack 1: blue over orange (orange corresponds to red/orange-looking block)
      (on blue_block red_block)

      ;; stack 2: yellow over green over red over purple
      (on yellow_block green_block)
      (on green_block red_block)
      (on red_block purple_block)
    )
  )
)