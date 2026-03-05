(define (problem put_clean_teapot_on_stove)
    (:domain put_task)
    (:objects
        agent - agent
        stove - receptacle
        sink - sink
        tea_pot - object
        fork - object
        pot - object
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent stove))
        (not (atLocation agent sink))
        (not (atLocation agent tea_pot))
        (not (atLocation agent fork))
        (not (atLocation agent pot))
        
        ; Tea pot is initially on the stove
        (inReceptacle tea_pot stove)
        
        ; Stove and sink are not openable
        (not (openable stove))
        (not (openable sink))
        
        ; Agent is not holding anything
        (not (holdsAny agent))
        
        ; Tea pot is not clean
        (not (isClean tea_pot))
        
        ; Stove is not toggled on
        (not (isOn stove))
    )
    (:goal
        (and
            (inReceptacle tea_pot stove)
            (isClean tea_pot)
        )
    )
)