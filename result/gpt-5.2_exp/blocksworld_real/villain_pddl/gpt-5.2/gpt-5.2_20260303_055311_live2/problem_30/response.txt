(define (problem blocksworld_color_stack_1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    orange - block
    purple - block
    green  - block
    blue   - block
    yellow - block
    red    - block
  )

  (:init
    (handempty robot1)

    ;; From the image: a single vertical stack (top to bottom):
    ;; orange on red on yellow on purple on green on blue (blue on table)
    (on orange red)
    (on red yellow)
    (on yellow purple)
    (on purple green)
    (on green blue)
    (ontable blue)

    (clear orange)
  )

  (:goal
    (and
      ;; Goal stack (top to bottom):
      ;; orange over purple over green over blue over yellow over red
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue yellow)
      (on yellow red)
      (ontable red)
      (clear orange)
    )
  )
)