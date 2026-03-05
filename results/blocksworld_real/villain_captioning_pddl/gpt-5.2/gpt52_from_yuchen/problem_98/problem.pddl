(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    block_yellow block_purple block_green block_red block_blue block_orange - block
    robot1 - robot
  )
  (:init
    ;; stack from top to bottom
    (on block_yellow block_purple)
    (on block_purple block_green)
    (on block_green block_red)
    (on block_red block_blue)
    (on block_blue block_orange)
    (ontable block_orange)

    ;; clear conditions
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