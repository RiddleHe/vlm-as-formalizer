(define (problem blocks_scene_stacks_2)
  (:domain blocksworld)
  (:objects
    red green blue yellow orange purple - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stack 1 in the scene: red on green
    (on red green)
    (ontable green)
    (clear red)

    ;; stack 2 in the scene: yellow on orange
    (on yellow orange)
    (ontable orange)
    (clear yellow)

    ;; single blocks on table
    (ontable blue)
    (clear blue)
    (ontable purple)
    (clear purple)

    ;; blocks that are not clear because something is on them
    (not (clear green))
    (not (clear orange))
  )
  (:goal
    (and
      ;; Stack A: green over orange over purple over blue
      (on green orange)
      (on orange purple)
      (on purple blue)
      (ontable blue)

      ;; Stack B: yellow over red
      (on yellow red)
      (ontable red)
    )
  )
)