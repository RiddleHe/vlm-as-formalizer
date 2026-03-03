(define (problem blocksworld_scene_stacks3)
  (:domain blocksworld)
  (:objects
    yellow green blue orange purple red - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: orange is on purple; all other blocks are on the table.
    (on orange purple)

    (ontable purple)
    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable red)

    ;; Clear conditions (no block on top)
    (clear orange)
    (clear yellow)
    (clear green)
    (clear blue)
    (clear red)

    ;; purple is not clear because orange is on it

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green yellow)
      (on blue orange)
      (on purple red)
    )
  )
)