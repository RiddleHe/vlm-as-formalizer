(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue green red yellow purple - block
    robot1 - robot
  )
  (:init
    ;; stack 1 in the scene: orange on blue on green
    (on orange blue)
    (on blue green)
    (ontable green)
    (clear orange)

    ;; stack 2 in the scene: red on yellow
    (on red yellow)
    (ontable yellow)
    (clear red)

    ;; single block on table
    (ontable purple)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; create stack: green over blue
      (on green blue)

      ;; create stack: yellow over red over purple over orange
      (on yellow red)
      (on red purple)
      (on purple orange)
    )
  )
)