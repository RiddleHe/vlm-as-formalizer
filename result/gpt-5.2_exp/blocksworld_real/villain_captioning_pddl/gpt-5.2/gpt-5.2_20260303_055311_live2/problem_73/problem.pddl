(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    block_red block_yellow block_orange block_blue block_green block_purple - block
    robot1 - robot
  )
  (:init
    ;; right stack: red on green on yellow (yellow on table)
    (on block_red block_green)
    (on block_green block_yellow)
    (ontable block_yellow)
    (clear block_red)

    ;; left stack: blue on orange (orange on table)
    (on block_blue block_orange)
    (ontable block_orange)
    (clear block_blue)

    ;; single block on table
    (ontable block_purple)
    (clear block_purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over orange over blue
      (on block_red block_yellow)
      (on block_yellow block_orange)
      (on block_orange block_blue)

      ;; stack 2: green over purple
      (on block_green block_purple)
    )
  )
)