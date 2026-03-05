(define (problem blocksworld_stack_purple_blue_green_yellow_red_orange)
  (:domain blocksworld)
  (:objects
    block_purple block_blue block_green block_yellow block_red block_orange - block
    robot1 - robot
  )
  (:init
    ;; right-side stack
    (on block_purple block_blue)
    (on block_blue block_green)
    (on block_green block_yellow)
    (on block_yellow block_red)
    (ontable block_red)

    ;; left-side single block
    (ontable block_orange)

    ;; clear conditions
    (clear block_purple)
    (clear block_orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on block_purple block_blue)
      (on block_blue block_green)
      (on block_green block_yellow)
      (on block_yellow block_red)
      (on block_red block_orange)
      (ontable block_orange)
    )
  )
)