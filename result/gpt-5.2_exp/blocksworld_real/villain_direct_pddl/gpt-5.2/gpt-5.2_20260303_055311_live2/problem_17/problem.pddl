(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green purple yellow red - block
    robot1 - robot
  )
  (:init
    ;; tower in the scene (bottom to top): yellow, purple, green, orange, blue
    (ontable yellow)
    (on purple yellow)
    (on green purple)
    (on orange green)
    (on blue orange)

    ;; separate red block on the table
    (ontable red)

    ;; clear blocks
    (clear blue)
    (clear red)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: orange over purple over blue (i.e., orange on purple, purple on blue)
      (on orange purple)
      (on purple blue)

      ;; stack 2: yellow over red over green (i.e., yellow on red, red on green)
      (on yellow red)
      (on red green)
    )
  )
)