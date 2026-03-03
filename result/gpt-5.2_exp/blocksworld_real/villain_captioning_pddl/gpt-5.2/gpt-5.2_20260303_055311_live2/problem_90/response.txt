(define (problem blocksworld_scene_3stacks)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    block_blue block_yellow block_orange block_green block_red block_purple - block
  )
  (:init
    (handempty robot1)

    (ontable block_purple)
    (on block_red block_purple)
    (on block_green block_red)
    (on block_orange block_green)
    (on block_yellow block_orange)
    (on block_blue block_yellow)

    (clear block_blue)
  )
  (:goal
    (and
      (on block_red block_blue)
      (on block_orange block_yellow)
      (on block_purple block_green)
    )
  )
)