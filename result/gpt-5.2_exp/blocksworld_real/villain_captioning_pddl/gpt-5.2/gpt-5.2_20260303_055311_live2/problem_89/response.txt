(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow blue green purple orange red - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (on yellow blue)
    (ontable blue)
    (clear yellow)

    ;; right stack
    (on green purple)
    (on purple orange)
    (ontable orange)
    (clear green)

    ;; single block
    (ontable red)
    (clear red)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: purple over green over blue over yellow
      (on purple green)
      (on green blue)
      (on blue yellow)
      (ontable yellow)

      ;; stack 2: orange over red
      (on orange red)
      (ontable red)
    )
  )
)