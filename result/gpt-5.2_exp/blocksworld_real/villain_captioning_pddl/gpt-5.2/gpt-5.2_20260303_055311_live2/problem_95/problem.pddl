(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green red purple yellow - block
    robot1 - robot
  )
  (:init
    ;; left stack: blue on orange on green
    (on blue orange)
    (on orange green)
    (ontable green)
    (clear blue)

    ;; right stack: red on purple
    (on red purple)
    (ontable purple)
    (clear red)

    ;; single block
    (ontable yellow)
    (clear yellow)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over red
      (on green red)

      ;; stack 2: blue over orange over purple over yellow
      (on blue orange)
      (on orange purple)
      (on purple yellow)
    )
  )
)