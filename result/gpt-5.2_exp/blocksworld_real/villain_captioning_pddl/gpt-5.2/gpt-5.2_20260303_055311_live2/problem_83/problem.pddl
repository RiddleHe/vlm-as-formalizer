(define (problem blocksworld_scene1_stack1)
  (:domain blocksworld)
  (:objects
    block_purple block_red block_yellow block_blue block_green block_orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; existing stack (bottom -> top): purple, red, yellow, blue, green
    (ontable block_purple)
    (on block_red block_purple)
    (on block_yellow block_red)
    (on block_blue block_yellow)
    (on block_green block_blue)

    ;; separate block
    (ontable block_orange)

    ;; clear blocks
    (clear block_green)
    (clear block_orange)
  )
  (:goal
    (and
      ;; create 1 stack: purple over red over blue over orange over yellow over green
      (on block_purple block_red)
      (on block_red block_blue)
      (on block_blue block_orange)
      (on block_orange block_yellow)
      (on block_yellow block_green)
    )
  )
)