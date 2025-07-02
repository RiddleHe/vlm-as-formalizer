(define (problem blocksworld)
(:domain blocksworld)
(:requirements :strips :typing)
(:objects
    yellow_block1 yellow_block2 yellow_block3
    purple_block1 purple_block2 purple_block3
    blue_block1 blue_block2 blue_block3
    red_block1 red_block2 red_block3
    orange_block1 orange_block2 orange_block3
    green_block1 green_block2 green_block3
    robot1
)
(:init
    (ontable yellow_block1)
    (ontable purple_block1)
    (ontable blue_block1)
    (ontable red_block1)
    (ontable orange_block1)
    (ontable green_block1)
    (handempty robot1)
    (clear yellow_block1)
    (clear purple_block1)
    (clear blue_block1)
    (clear red_block1)
    (clear orange_block1)
    (clear green_block1)
)
(:goal
    (and
        (on yellow_block2 purple_block1)
        (on blue_block2 red_block1)
        (on orange_block2 green_block1)
    )
)
)