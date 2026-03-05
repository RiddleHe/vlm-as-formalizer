(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    block_blue block_yellow block_purple block_red block_green block_orange - block
    robot1 - robot
  )
  (:init
    (ontable block_blue)
    (on block_yellow block_blue)
    (on block_purple block_yellow)
    (on block_red block_purple)
    (on block_green block_red)
    (on block_orange block_green)

    (clear block_orange)

    (handempty robot1)
  )
  (:goal
    (and
      (ontable block_red)
      (on block_yellow block_red)
      (on block_purple block_yellow)
      (on block_green block_purple)
      (on block_orange block_green)
      (on block_blue block_orange)
      (clear block_blue)
    )
  )
)