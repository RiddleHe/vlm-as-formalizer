(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    yellow green purple red blue orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block relations observed in the scene
    (on yellow orange)
    (on green purple)
    (on red green)

    (ontable orange)
    (ontable purple)
    (ontable blue)

    (clear yellow)
    (clear red)
    (clear blue)
  )
  (:goal
    (and
      (on yellow green)
      (on green purple)
      (on purple red)
      (on red blue)
      (on blue orange)
      (ontable orange)
      (clear yellow)
    )
  )
)