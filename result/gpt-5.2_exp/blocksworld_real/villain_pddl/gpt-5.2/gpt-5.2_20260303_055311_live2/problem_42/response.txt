(define (problem blocks_scene_01)
  (:domain blocksworld)
  (:objects
    green yellow purple red orange blue - block
    robot1 - robot
  )
  (:init
    ;; From the image: a single vertical stack (top to bottom):
    ;; green on yellow on purple on red on orange on blue, with blue on the table.
    (on green yellow)
    (on yellow purple)
    (on purple red)
    (on red orange)
    (on orange blue)
    (ontable blue)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Create 3 stacks:
      (on purple green)
      (on orange red)
      (on blue yellow)
    )
  )
)