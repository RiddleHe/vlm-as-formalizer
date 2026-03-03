(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue red orange purple green yellow - block
    robot1 - robot
  )
  (:init
    ;; Current stack in the scene (top to bottom):
    (on blue red)
    (on red orange)
    (on orange purple)
    (on purple green)
    (on green yellow)
    (ontable yellow)

    (clear blue)
    (handempty robot1)
  )
  (:goal
    (and
      (on red blue)
      (on blue green)
      (on green yellow)
      (on yellow orange)
      (on orange purple)
      (ontable purple)
      (clear red)
    )
  )
)