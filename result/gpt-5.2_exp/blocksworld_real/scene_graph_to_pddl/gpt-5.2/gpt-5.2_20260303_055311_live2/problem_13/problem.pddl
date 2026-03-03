(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue_block_front_stack - block
    purple_block_front_stack - block
    yellow_block_front_stack - block
    green_block_back_stack - block
    red_block_back_stack - block
    orange_block_back_stack - block
    robot_arm - robot
  )

  (:init
    ;; front/right stack
    (ontable yellow_block_front_stack)
    (on purple_block_front_stack yellow_block_front_stack)
    (on blue_block_front_stack purple_block_front_stack)
    (clear blue_block_front_stack)

    ;; back/left stack
    (ontable orange_block_back_stack)
    (on red_block_back_stack orange_block_back_stack)
    (on green_block_back_stack red_block_back_stack)
    (clear green_block_back_stack)

    ;; robot state
    (handempty robot_arm)
  )

  (:goal
    (and
      ;; stack 1: blue over yellow
      (on blue_block_front_stack yellow_block_front_stack)

      ;; stack 2: orange over red over purple over green
      (on orange_block_back_stack red_block_back_stack)
      (on red_block_back_stack purple_block_front_stack)
      (on purple_block_front_stack green_block_back_stack)
    )
  )
)