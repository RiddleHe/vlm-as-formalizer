(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue purple orange red yellow - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table, except orange which is under purple
    (ontable green)
    (ontable blue)
    (ontable purple)
    (ontable red)
    (ontable yellow)

    (on purple orange)
    (ontable orange)

    ;; clear conditions
    (clear green)
    (clear blue)
    (clear purple)
    (clear red)
    (clear yellow)
    ;; orange is not clear because purple is on it

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on green blue)
      (on red purple)
    )
  )
)