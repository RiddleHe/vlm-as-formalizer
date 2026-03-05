(define (problem put_pump_bottle_in_garbage_can)
    (:domain put_task)
    (:objects
        agent1 - agent
        pump_bottle - object
        garbage_can - receptacle
        toilet_tank - object  ; not a receptacle, but a surface where the pump bottle is located
    )
    (:init
        ; The agent is not at any location initially
        (not (atLocation agent1 pump_bottle))
        (not (atLocation agent1 garbage_can))
        (not (atLocation agent1 toilet_tank))

        ; The pump bottle is on the toilet tank
        (atLocation pump_bottle toilet_tank)

        ; The garbage can is on the floor and is openable (and currently open, as per scene)
        (openable garbage_can)
        (opened garbage_can)

        ; The garbage can is empty
        (not (inReceptacle pump_bottle garbage_can))

        ; The agent is not holding anything
        (not (holdsAny agent1))
    )
    (:goal
        (and
            (inReceptacle pump_bottle garbage_can)
        )
    )
)