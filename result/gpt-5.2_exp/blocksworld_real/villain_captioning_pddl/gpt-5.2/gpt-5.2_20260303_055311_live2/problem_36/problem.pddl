(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red_block blue_block yellow_block orange_block green_block purple_block - block
    robot1 - robot
  )
  (:init
    ;; stacks in the scene
    (on orange_block yellow_block)
    (ontable yellow_block)
    (clear orange_block)

    (on blue_block red_block)
    (ontable red_block)
    (clear blue_block)

    ;; single blocks on table
    (ontable green_block)
    (clear green_block)
    (ontable purple_block)
    (clear purple_block)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over blue
      (on red_block yellow_block)
      (on yellow_block blue_block)

      ;; stack 2: orange over green over purple
      (on orange_block green_block)
      (on green_block purple_block)
    )
  )
)