(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    orange_block blue_block yellow_block purple_block red_block green_block - block
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left stack: orange on blue (blue on table)
    (on orange_block blue_block)
    (ontable blue_block)
    (clear orange_block)

    ;; right stack: yellow on purple (purple on table)
    (on yellow_block purple_block)
    (ontable purple_block)
    (clear yellow_block)

    ;; single blocks on table
    (ontable red_block)
    (clear red_block)
    (ontable green_block)
    (clear green_block)
  )
  (:goal
    (and
      ;; stack 1: orange over blue over yellow
      (on orange_block blue_block)
      (on blue_block yellow_block)

      ;; stack 2: purple over red over green
      (on purple_block red_block)
      (on red_block green_block)
    )
  )
)