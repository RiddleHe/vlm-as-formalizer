(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow purple blue green orange - block
    robot1 - robot
  )
  (:init
    ;; stack: red on yellow on purple on blue on green (green on table)
    (ontable green)
    (on blue green)
    (on purple blue)
    (on yellow purple)
    (on red yellow)

    ;; separate block
    (ontable orange)

    ;; clear blocks
    (clear red)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: yellow over blue
      (on yellow blue)

      ;; stack 2: purple over red over green over orange
      (on green orange)
      (on red green)
      (on purple red)
    )
  )
)