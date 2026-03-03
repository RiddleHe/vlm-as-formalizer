(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow red orange purple green blue - block
    robot1 - robot
  )
  (:init
    ;; Left stack
    (on purple orange)
    (ontable orange)
    (clear purple)

    ;; Right stack
    (on blue green)
    (ontable green)
    (clear blue)

    ;; Single blocks
    (ontable yellow)
    (clear yellow)
    (ontable red)
    (clear red)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow blue)
      (on orange purple)
      (on red green)
    )
  )
)