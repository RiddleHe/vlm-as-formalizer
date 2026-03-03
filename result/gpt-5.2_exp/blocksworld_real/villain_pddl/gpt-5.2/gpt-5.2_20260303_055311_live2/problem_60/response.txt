(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    red orange blue yellow purple green - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current scene (from image)
    (ontable orange)
    (on blue orange)
    (on yellow blue)
    (on purple yellow)
    (on green purple)
    (clear green)

    (ontable red)
    (clear red)
  )
  (:goal
    (and
      ;; Stack 1: red over green
      (on red green)

      ;; Stack 2: orange over blue over purple over yellow
      (on orange blue)
      (on blue purple)
      (on purple yellow)
    )
  )
)