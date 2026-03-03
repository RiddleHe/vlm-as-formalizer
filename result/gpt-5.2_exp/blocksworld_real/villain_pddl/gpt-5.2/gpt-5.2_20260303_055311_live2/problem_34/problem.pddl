(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    purple yellow green red blue orange - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; blocks in the scene (initially stacked as a single tower)
    (ontable blue)
    (on purple blue)
    (on orange purple)
    (on red orange)
    (on green red)
    (on yellow green)

    ;; clear status
    (clear yellow)
  )
  (:goal
    (and
      ;; stack 1: purple over yellow
      (on purple yellow)

      ;; stack 2: green over red
      (on green red)

      ;; stack 3: blue over orange
      (on blue orange)
    )
  )
)