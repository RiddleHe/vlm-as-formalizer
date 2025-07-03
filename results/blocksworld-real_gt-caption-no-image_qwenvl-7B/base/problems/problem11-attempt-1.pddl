(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        robot1
        P1 Y1 B1 R1 G1 O1
    )
    (:init
        (clear P1)
        (clear Y1)
        (clear B1)
        (clear R1)
        (clear G1)
        (clear O1)
        (ontable P1)
        (ontable Y1)
        (ontable B1)
        (ontable R1)
        (ontable G1)
        (ontable O1)
        (handempty robot1)
    )
    (:goal
        (and
            (on G1 B1)
            (on B1 P1)
            (on P1 Y1)
            (on R1 Y1)
        )
    )
)