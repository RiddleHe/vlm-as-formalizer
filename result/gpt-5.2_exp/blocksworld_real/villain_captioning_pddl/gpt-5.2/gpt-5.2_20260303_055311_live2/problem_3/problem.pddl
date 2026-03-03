(define (problem blocksworld_scene_2stacks)
  (:domain blocksworld)
  (:objects
    blue green orange red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; tower from bottom to top: green, blue, orange, red, yellow, purple
    (ontable green)
    (on blue green)
    (on orange blue)
    (on red orange)
    (on yellow red)
    (on purple yellow)

    ;; only the top block is clear
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: purple over red
      (on purple red)

      ;; stack 2: yellow over orange over green over blue
      (on yellow orange)
      (on orange green)
      (on green blue)
      (ontable blue)
    )
  )
)