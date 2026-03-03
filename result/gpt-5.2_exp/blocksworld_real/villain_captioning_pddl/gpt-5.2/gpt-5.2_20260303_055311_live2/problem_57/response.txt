(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    block_yellow block_green block_purple block_red block_orange block_blue - block
    robot_1 - robot
  )
  (:init
    ;; left stack: yellow on green on purple (purple on table)
    (ontable block_purple)
    (on block_green block_purple)
    (on block_yellow block_green)
    (clear block_yellow)

    ;; right stack: red on orange on blue (blue on table)
    (ontable block_blue)
    (on block_orange block_blue)
    (on block_red block_orange)
    (clear block_red)

    ;; robot state
    (handempty robot_1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over orange
      (on block_yellow block_orange)
      (on block_red block_yellow)

      ;; stack 2: green over blue over purple
      (on block_blue block_purple)
      (on block_green block_blue)
    )
  )
)