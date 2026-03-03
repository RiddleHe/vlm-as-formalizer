(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    block_yellow block_red block_orange block_purple block_blue block_green - block
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; current stack in the scene
    (on block_red block_yellow)
    (ontable block_yellow)
    (clear block_red)

    ;; single blocks on table
    (ontable block_orange)
    (clear block_orange)

    (ontable block_purple)
    (clear block_purple)

    (ontable block_blue)
    (clear block_blue)

    (ontable block_green)
    (clear block_green)
  )
  (:goal
    (and
      (on block_yellow block_purple)
      (on block_blue block_red)
      (on block_orange block_green)
    )
  )
)