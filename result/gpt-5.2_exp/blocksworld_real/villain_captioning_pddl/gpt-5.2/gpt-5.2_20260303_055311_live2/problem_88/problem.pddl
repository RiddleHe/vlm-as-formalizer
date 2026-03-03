(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue orange purple yellow red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack 1 (left tower)
    (ontable green)
    (on blue green)
    (on orange blue)
    (clear orange)

    ;; stack 2 (right stack)
    (ontable yellow)
    (on red yellow)
    (clear red)

    ;; single block
    (ontable purple)
    (clear purple)
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