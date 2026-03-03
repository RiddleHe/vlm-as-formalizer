(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    red purple blue orange yellow green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack on the left: red on purple on blue
    (on red purple)
    (on purple blue)
    (ontable blue)
    (clear red)

    ;; single blocks on the table
    (ontable orange)
    (clear orange)

    (ontable green)
    (clear green)

    (ontable yellow)
    (clear yellow)
  )
  (:goal
    (and
      ;; stack 1
      (on green red)

      ;; stack 2: yellow over purple over blue over orange
      (on purple blue)
      (on blue orange)
      (on yellow purple)
    )
  )
)