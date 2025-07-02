(define (problem blocksworld)
(:domain blocksworld)
(:requirements :strips :typing)
(:objects
    orange_block1
    orange_block2
    red_block1
    red_block2
    yellow_block1
    blue_block1
    blue_block2
    purple_block1
    green_block1
    robot1
)
(:init
    (ontable orange_block1)
    (ontable orange_block2)
    (ontable red_block1)
    (ontable red_block2)
    (ontable yellow_block1)
    (ontable blue_block1)
    (ontable blue_block2)
    (ontable purple_block1)
    (ontable green_block1)
    (handempty robot1)
)
(:goal
    (and
        (on orange_block2 orange_block1)
        (on orange_block1 ontable)
        (on red_block2 red_block1)
        (on red_block1 orange_block2)
        (on yellow_block1 yellow_block2)
        (on yellow_block2 red_block2)
        (on blue_block2 blue_block1)
        (on blue_block1 purple_block1)
        (on purple_block1 green_block1)
    )
)
)