(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    block_orange block_red block_yellow block_blue block_purple block_green - block
    robot1 - robot
  )
  (:init
    ;; existing single tower (bottom -> top):
    (ontable block_orange)
    (on block_blue block_orange)
    (on block_red block_blue)
    (on block_green block_red)
    (on block_purple block_green)
    (on block_yellow block_purple)

    ;; clear status
    (clear block_yellow)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on block_orange block_red)
      (on block_yellow block_blue)
      (on block_purple block_green)
    )
  )
)