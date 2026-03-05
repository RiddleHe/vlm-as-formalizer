(define (problem blocksworld-1)
    (:domain blocksworld)
    (:objects
        block-red
        block-blue
        block-orange
        block-yellow
        block-green
        block-purple
        robot1
    )
    (:init
        (on block-red block-blue)
        (ontable block-orange)
        (ontable block-yellow)
        (ontable block-green)
        (ontable block-purple)
        (clear block-red)
        (clear block-orange)
        (clear block-yellow)
        (clear block-green)
        (clear block-purple)
        (handempty robot1)
    )
    (:goal (and
        (on block-blue block-orange)
        (on block-orange block-purple)
        (on block-purple block-yellow)
        (on block-yellow block-green)
        (on block-green block-red)
        (ontable block-red)
        (clear block-blue)
    ))
)