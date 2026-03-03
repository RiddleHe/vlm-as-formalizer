(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    blue green orange red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; initial configuration from the image:
    (ontable green)
    (on blue green)
    (on orange blue)
    (on red orange)
    (on yellow red)
    (on purple yellow)
    (clear purple)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: purple over red
      (on purple red)

      ;; Stack 2: yellow over orange over green over blue
      (on yellow orange)
      (on orange green)
      (on green blue)
    )
  )
)