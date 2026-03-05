(define (problem put_clean_soap_on_toilet)
    (:domain put_task)
    (:objects
        agent1 - agent
        sink1 - sink
        toilet1 - object
        soap1 - object
    )
    (:init
        (atLocation agent1 sink1) ; Agent starts at sink for simplicity, as it must go somewhere to begin
        (inReceptacle soap1 sink1) ; Assuming soap is initially in sink for domain compliance; actual scene has it in bathtub, but bathtub not a receptacle in domain
        (not (isClean soap1))
        (not (holdsAny agent1))
        (not (holds agent1 soap1))
        (openable sink1)
        (not (opened sink1))
    )
    (:goal (and
        (inReceptacle soap1 toilet1) ; Goal: soap is on toilet (treated as a receptacle for placement, though not defined as one in domain)
        (isClean soap1)
    ))
)