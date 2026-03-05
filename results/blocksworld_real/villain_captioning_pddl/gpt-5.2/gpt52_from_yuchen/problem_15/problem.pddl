(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    block_green block_yellow block_orange block_blue block_purple block_red - block
    robot1 - robot
  )
  (:init
    (on block_green block_yellow)
    (on block_yellow block_orange)
    (on block_orange block_blue)
    (on block_blue block_purple)
    (on block_purple block_red)
    (ontable block_red)

    (clear block_green)
    (handempty robot1)
  )
  (:goal
    (and
      (on block_yellow block_blue)
      (on block_blue block_purple)
      (on block_purple block_orange)
      (on block_orange block_green)
      (on block_green block_red)
      (ontable block_red)
    )
  )
)