(define (problem blocksworld-goal)
    (:domain blocksworld)
    (:objects
        block-orange1
        block-purple1
        block-red1
        block-blue1
        block-yellow1
        block-green1
        robot1
    )
    (:init
        (on block-red1 block-purple1)
        (on block-purple1 block-orange1)
        (on block-blue1 block-yellow1)
        (on block-yellow1 block-green1)
        (ontable block-orange1)
        (ontable block-green1)
        (clear block-red1)
        (clear block-blue1)
        (handempty robot1)
    )
    (:goal (and
        (on block-orange1 block-blue1)
        (on block-red1 block-green1)
        (on block-yellow1 block-purple1)
        (ontable block-blue1)
        (ontable block-green1)
        (ontable block-purple1)
        (clear block-orange1)
        (clear block-red1)
        (clear block-yellow1)
    ))
)