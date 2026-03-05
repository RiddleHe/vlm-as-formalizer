(define (problem bathroom_scene)
    (:domain put_task)
    (:objects
        robot - agent
        sink - sink
        vanity_cabinet - receptacle  ; Though not in domain, added as a placeholder for the cabinet under sink
    )
    (:init
        (atLocation robot sink)  ; Robot starts at the sink location as it's the only identifiable object
        (openable vanity_cabinet)  ; Assuming the cabinet is openable
        (not (opened vanity_cabinet))  ; Cabinet is initially closed
        ; No spray bottles or garbage bin exist, so they are not included
    )
    (:goal (and
        ; Goal is impossible: no spray bottles or garbage bin in scene
        (inReceptacle spray_bottle_1 garbage_bin)
        (inReceptacle spray_bottle_2 garbage_bin)
    ))
)