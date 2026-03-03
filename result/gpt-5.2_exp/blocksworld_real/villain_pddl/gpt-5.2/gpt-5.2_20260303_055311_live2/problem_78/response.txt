(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    green blue purple yellow orange red - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current scene (from image): a stack of purple on orange on blue; red, yellow, green are on the table
    (on purple orange)
    (on orange blue)
    (ontable blue)

    (ontable red)
    (ontable yellow)
    (ontable green)

    ;; clear blocks
    (clear purple)
    (clear red)
    (clear yellow)
    (clear green)
  )
  (:goal
    (and
      ;; stack 1: green over blue over purple
      (on green blue)
      (on blue purple)

      ;; stack 2: yellow over orange over red
      (on yellow orange)
      (on orange red)
    )
  )
)