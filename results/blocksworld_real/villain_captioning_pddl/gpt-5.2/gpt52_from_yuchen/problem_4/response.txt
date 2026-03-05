(define (problem blocksworld_scene1_two_stacks)
  (:domain blocksworld)
  (:objects
    block_orange block_red block_purple block_blue block_yellow block_green - block
    robot1 - robot
  )
  (:init
    ;; tower (top -> bottom): orange on red on purple on blue on yellow on green
    (on block_orange block_red)
    (on block_red block_purple)
    (on block_purple block_blue)
    (on block_blue block_yellow)
    (on block_yellow block_green)
    (ontable block_green)

    ;; clear
    (clear block_orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: purple over green
      (on block_purple block_green)

      ;; stack 2: blue over red over orange over yellow
      (on block_blue block_red)
      (on block_red block_orange)
      (on block_orange block_yellow)

      ;; ensure the bottom blocks of each stack are on the table
      (ontable block_green)
      (ontable block_yellow)
    )
  )
)