(define (problem blocksworld_stack_reverse)
  (:domain blocksworld)
  (:objects
    block_green block_orange block_blue block_red block_yellow - block
    robot1 - robot
  )
  (:init
    ;; current tower (top -> bottom): green, orange, blue, red, yellow
    (ontable block_yellow)
    (on block_red block_yellow)
    (on block_blue block_red)
    (on block_orange block_blue)
    (on block_green block_orange)

    (clear block_green)

    (handempty robot1)
  )
  (:goal
    (and
      ;; goal tower (top -> bottom): yellow, red, blue, orange, green
      (ontable block_green)
      (on block_orange block_green)
      (on block_blue block_orange)
      (on block_red block_blue)
      (on block_yellow block_red)
    )
  )
)