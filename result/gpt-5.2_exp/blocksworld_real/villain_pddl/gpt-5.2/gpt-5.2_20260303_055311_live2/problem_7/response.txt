(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue orange green purple yellow red - block
    robot1 - robot
  )
  (:init
    ;; From visual analysis: a single vertical stack (top to bottom):
    ;; orange on green on red on purple on yellow on blue (blue on table)
    (on orange green)
    (on green red)
    (on red purple)
    (on purple yellow)
    (on yellow blue)
    (ontable blue)

    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Goal stack (top to bottom): blue over orange over green over purple over yellow over red
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple yellow)
      (on yellow red)
      (ontable red)
    )
  )
)