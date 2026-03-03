(define (problem blocksworld_scene1)
  (:domain blocksworld)

  (:objects
    block_green block_yellow block_orange block_blue block_purple block_red - block
    robot1 - robot
  )

  (:init
    ;; robot state
    (handempty robot1)

    ;; current tower (bottom -> top): red, green, yellow, orange, blue, purple
    (ontable block_red)
    (on block_green block_red)
    (on block_yellow block_green)
    (on block_orange block_yellow)
    (on block_blue block_orange)
    (on block_purple block_blue)

    ;; only the top block is clear
    (clear block_purple)
  )

  (:goal
    (and
      ;; desired single stack (bottom -> top): red, green, orange, purple, blue, yellow
      (ontable block_red)
      (on block_green block_red)
      (on block_orange block_green)
      (on block_purple block_orange)
      (on block_blue block_purple)
      (on block_yellow block_blue)
      (clear block_yellow)
    )
  )
)