(define (problem put_task_problem)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        fridge1 - fridge
        sink1 - sink
        knife1 - knife
    )
    (:init
        ; No objects are present in the scene that match the domain's object types.
        ; Therefore, no initial state predicates can be set for objects that exist in the scene.
        ; The agent is not at any location initially.
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 sink1))
        ; No receptacles are openable or opened as they are not present.
        ; No objects are held, clean, hot, cool, on, toggled, or sliced.
    )
    (:goal
        ; The goal cannot be achieved because the required objects (bowl, pencil, nightstand) are not defined in the domain.
        ; This goal is impossible to satisfy with the given domain.
        (and)
    )
)