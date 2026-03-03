(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue orange purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current scene (from image)
    (on orange blue)
    (on blue green)
    (ontable green)

    (ontable purple)
    (on red yellow)
    (ontable yellow)

    ;; clear blocks
    (clear orange)
    (clear purple)
    (clear red)
  )
  (:goal
    (and
      ;; stack 1: green over blue
      (on green blue)

      ;; stack 2: yellow over red over purple over orange
      (on yellow red)
      (on red purple)
      (on purple orange)
    )
  )
)