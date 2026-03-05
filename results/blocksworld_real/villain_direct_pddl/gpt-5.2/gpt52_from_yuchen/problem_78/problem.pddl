(define (problem blocksworld_scene_01)
  (:domain blocksworld)
  (:objects
    green blue purple yellow orange red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; current block configuration from the image
    (on purple orange)
    (on orange blue)
    (ontable blue)

    (ontable yellow)
    (ontable red)
    (ontable green)

    ;; clear conditions
    (clear purple)
    (clear yellow)
    (clear red)
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