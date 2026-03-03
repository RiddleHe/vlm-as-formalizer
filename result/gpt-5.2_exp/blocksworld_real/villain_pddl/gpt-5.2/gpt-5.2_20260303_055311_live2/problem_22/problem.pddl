(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange - block
    red - block
    blue - block
    green - block
    purple - block
    yellow - block
    robot1 - robot
  )
  (:init
    ;; assumed from the image: one vertical stack (top to bottom):
    ;; orange on red on blue on green on purple on yellow (yellow on table)
    (on orange red)
    (on red blue)
    (on blue green)
    (on green purple)
    (on purple yellow)
    (ontable yellow)

    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over orange
      (on green orange)

      ;; stack 2: purple over yellow over red over blue
      (on purple yellow)
      (on yellow red)
      (on red blue)
    )
  )
)