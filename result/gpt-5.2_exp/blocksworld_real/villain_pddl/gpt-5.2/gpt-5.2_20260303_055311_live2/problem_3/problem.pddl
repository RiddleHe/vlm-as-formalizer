(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple red yellow orange green blue - block
    robot1 - robot
  )
  (:init
    ;; Initial stack in the scene (bottom to top):
    ;; green, blue, orange, red, yellow, purple
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
      (on green blue)
      (on orange green)
      (on yellow orange)
    )
  )
)