(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    block_green block_orange block_red block_yellow block_blue block_purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stacks currently present
    (on block_yellow block_red)
    (ontable block_red)
    (clear block_yellow)

    (on block_purple block_blue)
    (ontable block_blue)
    (clear block_purple)

    ;; single blocks on table
    (ontable block_green)
    (clear block_green)

    (ontable block_orange)
    (clear block_orange)
  )
  (:goal
    (and
      (on block_purple block_red)
      (on block_red block_blue)
      (on block_blue block_yellow)
      (on block_yellow block_orange)
      (on block_orange block_green)
      (ontable block_green)
    )
  )
)