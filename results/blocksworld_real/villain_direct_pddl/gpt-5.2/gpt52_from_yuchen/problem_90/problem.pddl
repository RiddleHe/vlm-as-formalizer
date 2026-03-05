(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue yellow orange green red purple - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current scene (single vertical stack)
    (ontable purple)
    (on red purple)
    (on green red)
    (on orange green)
    (on yellow orange)
    (on blue yellow)

    ;; clear status
    (clear blue)
  )
  (:goal
    (and
      ;; stack 1: red over blue
      (on red blue)
      ;; stack 2: orange over yellow
      (on orange yellow)
      ;; stack 3: purple over green
      (on purple green)
    )
  )
)