(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange yellow green red purple - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Stacks visible in the scene (bottom -> top):
    ;; orange has blue on it
    (ontable orange)
    (on blue orange)
    (clear blue)

    ;; green has yellow on it
    (ontable green)
    (on yellow green)
    (clear yellow)

    ;; purple has red on it
    (ontable purple)
    (on red purple)
    (clear red)
  )
  (:goal
    (and
      ;; Create 3 stacks: orange over yellow, green over blue, purple over red
      (on orange yellow)
      (on green blue)
      (on purple red)
    )
  )
)