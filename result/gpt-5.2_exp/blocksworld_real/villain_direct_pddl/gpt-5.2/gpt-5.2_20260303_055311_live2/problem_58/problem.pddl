(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow green blue orange purple red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block relations from the image
    (on orange purple)

    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable red)
    (ontable purple)

    (clear yellow)
    (clear green)
    (clear blue)
    (clear orange)
    (clear red)
  )
  (:goal
    (and
      (on green yellow)
      (on blue orange)
      (on purple red)
    )
  )
)