(define (problem blocksworld_two_stacks)
  (:domain blocksworld)
  (:objects
    block_green block_yellow block_pink block_purple block_orange block_red - block
    robot1 - robot
  )
  (:init
    ;; stack from bottom to top: green, yellow, pink, purple, orange, red
    (ontable block_green)
    (on block_yellow block_green)
    (on block_pink block_yellow)
    (on block_purple block_pink)
    (on block_orange block_purple)
    (on block_red block_orange)

    (clear block_red)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over yellow over pink  (i.e., green on yellow, yellow on pink)
      (on block_green block_yellow)
      (on block_yellow block_pink)

      ;; stack 2: purple over orange over red  (i.e., purple on orange, orange on red)
      (on block_purple block_orange)
      (on block_orange block_red)
    )
  )
)