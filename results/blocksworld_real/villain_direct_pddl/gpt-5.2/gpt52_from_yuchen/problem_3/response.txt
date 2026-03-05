(define (problem blocks_scene_stacks2)
  (:domain blocksworld)
  (:objects
    blue - block
    green - block
    orange - block
    red - block
    yellow - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; Current stack in the image (bottom to top):
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

      ;; Stack 2: yellow over orange over green over blue (with blue on table)
      (ontable blue)
      (on green blue)
      (on orange green)
      (on yellow orange)
    )
  )
)