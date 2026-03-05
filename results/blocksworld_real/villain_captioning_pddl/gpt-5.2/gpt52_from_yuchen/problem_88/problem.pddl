(define (problem blocksworld_scene1)
  (:domain blocksworld)

  (:objects
    orange blue green purple red yellow - block
    robot1 - robot
  )

  (:init
    ;; stack 1
    (on orange blue)
    (on blue green)
    (ontable green)
    (clear orange)

    ;; stack 2
    (on red yellow)
    (ontable yellow)
    (clear red)

    ;; single block
    (ontable purple)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )

  (:goal
    (and
      ;; stack A: green over blue
      (on green blue)

      ;; stack B: yellow over red over purple over orange
      (on yellow red)
      (on red purple)
      (on purple orange)
    )
  )
)