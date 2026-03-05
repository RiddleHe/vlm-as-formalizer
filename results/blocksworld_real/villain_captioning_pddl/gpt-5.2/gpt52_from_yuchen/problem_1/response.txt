(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    block_green block_blue block_purple block_orange block_red block_yellow - block
    robot1 - robot
  )
  (:init
    ;; blocks on table
    (ontable block_green)
    (ontable block_blue)
    (ontable block_orange)
    (ontable block_red)
    (ontable block_yellow)

    ;; existing stack
    (on block_purple block_orange)

    ;; clear blocks
    (clear block_green)
    (clear block_blue)
    (clear block_purple)
    (clear block_red)
    (clear block_yellow)
    ;; block_orange is not clear because block_purple is on it

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on block_orange block_yellow)
      (on block_green block_blue)
      (on block_red block_purple)
    )
  )
)