(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    block_blue block_red block_orange block_purple block_green block_yellow - block
    robot1 - robot
  )
  (:init
    ;; tower (bottom to top): yellow, green, purple, orange, red, blue
    (ontable block_yellow)
    (on block_green block_yellow)
    (on block_purple block_green)
    (on block_orange block_purple)
    (on block_red block_orange)
    (on block_blue block_red)

    (clear block_blue)

    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack (top to bottom): red, blue, green, yellow, orange, purple
      (on block_red block_blue)
      (on block_blue block_green)
      (on block_green block_yellow)
      (on block_yellow block_orange)
      (on block_orange block_purple)
      (ontable block_purple)
    )
  )
)