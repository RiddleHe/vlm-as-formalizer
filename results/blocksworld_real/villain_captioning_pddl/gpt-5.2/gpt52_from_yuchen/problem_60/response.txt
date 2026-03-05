(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    block_orange block_blue block_yellow block_purple block_green block_red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; table placements
    (ontable block_orange)
    (ontable block_red)

    ;; stacking relations (bottom -> top): orange, blue, yellow, purple, green
    (on block_blue block_orange)
    (on block_yellow block_blue)
    (on block_purple block_yellow)
    (on block_green block_purple)

    ;; clear blocks (tops of stacks)
    (clear block_green)
    (clear block_red)
  )
  (:goal
    (and
      ;; stack 1: red over green
      (on block_red block_green)

      ;; stack 2: orange over blue over purple over yellow
      (ontable block_yellow)
      (on block_purple block_yellow)
      (on block_blue block_purple)
      (on block_orange block_blue)
    )
  )
)