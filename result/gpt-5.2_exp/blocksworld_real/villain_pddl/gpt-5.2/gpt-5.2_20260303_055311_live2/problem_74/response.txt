(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow green purple red blue orange - block
    robot1 - robot
  )

  (:init
    ;; Robot
    (handempty robot1)

    ;; Current block configuration from the image:
    ;; Left stack: yellow on orange (orange on table)
    (on yellow orange)
    (ontable orange)
    (clear yellow)

    ;; Right stack: red on green on purple (purple on table)
    (on red green)
    (on green purple)
    (ontable purple)
    (clear red)

    ;; Blue block alone on the table
    (ontable blue)
    (clear blue)

    ;; Blocks that have something on top are not clear
    (not (clear orange))
    (not (clear green))
    (not (clear purple))
  )

  (:goal
    (and
      (ontable orange)
      (on blue orange)
      (on red blue)
      (on purple red)
      (on green purple)
      (on yellow green)
      (clear yellow)
    )
  )
)