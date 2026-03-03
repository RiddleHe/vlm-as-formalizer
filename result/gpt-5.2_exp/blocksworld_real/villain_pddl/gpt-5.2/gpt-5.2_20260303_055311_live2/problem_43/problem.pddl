(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow orange purple red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table except orange which is on purple (as seen stacked)
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable purple)
    (ontable red)

    (on orange purple)

    ;; clear status
    (clear green)
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)
    ;; purple is not clear because orange is on it

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green orange)
      (on orange blue)
      (on blue yellow)
      (on purple red)
    )
  )
)