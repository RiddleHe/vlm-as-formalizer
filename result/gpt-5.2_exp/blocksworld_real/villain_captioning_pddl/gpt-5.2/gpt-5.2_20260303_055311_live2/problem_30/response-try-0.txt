(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange red yellow purple green - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene (top to bottom): orange on red on yellow on purple on green
    (on orange red)
    (on red yellow)
    (on yellow purple)
    (on purple green)
    (ontable green)

    ;; only the top block is clear
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; requested single stack (top to bottom):
      ;; orange over purple over green over blue over yellow over red
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue yellow)
      (on yellow red)
      (ontable red)
    )
  )
)