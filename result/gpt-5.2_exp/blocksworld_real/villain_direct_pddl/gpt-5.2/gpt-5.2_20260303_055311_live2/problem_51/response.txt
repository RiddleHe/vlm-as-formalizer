(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange purple red yellow green blue - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block configurations from the image
    (on blue orange)
    (ontable orange)
    (ontable yellow)
    (ontable purple)
    (ontable green)
    (ontable red)

    ;; clear conditions
    (clear blue)
    (clear yellow)
    (clear purple)
    (clear green)
    (clear red)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red yellow)
      (on green blue)
    )
  )
)