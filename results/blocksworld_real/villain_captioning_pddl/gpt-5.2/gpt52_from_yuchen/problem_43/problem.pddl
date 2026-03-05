(define (problem blocksworld-stacks-2)
  (:domain blocksworld)
  (:objects
    block-green block-blue block-yellow block-orange block-purple block-red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; table placements
    (ontable block-green)
    (ontable block-blue)
    (ontable block-yellow)
    (ontable block-purple)
    (ontable block-red)

    ;; existing stack
    (on block-orange block-purple)

    ;; clear blocks
    (clear block-green)
    (clear block-blue)
    (clear block-yellow)
    (clear block-orange)
    (clear block-red)
  )
  (:goal
    (and
      ;; Stack 1: green over orange over blue over yellow
      (on block-green block-orange)
      (on block-orange block-blue)
      (on block-blue block-yellow)

      ;; Stack 2: purple over red
      (on block-purple block-red)
    )
  )
)