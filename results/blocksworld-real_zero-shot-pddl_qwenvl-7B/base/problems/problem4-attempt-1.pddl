(define (problem blocksworld)
(:domain blocksworld)
(:requirements :strips :typing)
(:objects
    orange_block1 - block
    orange_block2 - block
    green_block1 - block
    green_block2 - block
    blue_block1 - block
    blue_block2 - block
    red_block1 - block
    red_block2 - block
    purple_block1 - block
    purple_block2 - block
    yellow_block1 - block
    yellow_block2 - block
    robot1 - robot
)
(:init
    (clear orange_block1)
    (clear orange_block2)
    (clear green_block1)
    (clear green_block2)
    (clear blue_block1)
    (clear blue_block2)
    (clear red_block1)
    (clear red_block2)
    (clear purple_block1)
    (clear purple_block2)
    (clear yellow_block1)
    (clear yellow_block2)
    (ontable orange_block1)
    (ontable orange_block2)
    (ontable green_block1)
    (ontable green_block2)
    (ontable blue_block1)
    (ontable blue_block2)
    (ontable red_block1)
    (ontable red_block2)
    (ontable purple_block1)
    (ontable purple_block2)
    (ontable yellow_block1)
    (ontable yellow_block2)
    (handempty robot1)
)
(:goal (and
    (on purple_block1 green_block1)
    (on green_block1 robot1)
    (on blue_block1 red_block1)
    (on red_block1 orange_block1)
    (on orange_block1 yellow_block1)
    (on yellow_block1 robot1)
))
)