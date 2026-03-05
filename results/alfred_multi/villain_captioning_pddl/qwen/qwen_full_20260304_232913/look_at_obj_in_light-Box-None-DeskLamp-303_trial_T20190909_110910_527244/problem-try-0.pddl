(define (problem look_at_box_by_lamp)
    (:domain put_task)
    (:objects
        agent
        box - receptacle
        lamp - object
        tablet - object
    )
    (:init
        (not (atLocation agent box))
        (not (atLocation agent lamp))
        (not (atLocation agent tablet))
        (isOn lamp)
        (not (holdsAny agent))
        (openable box) ; Though not in domain's openable list, we assume it's openable for context
        (opened box)   ; Box is open as per scene
        (not (inReceptacle tablet box)) ; Tablet is on desk, not in box
        (not (inReceptacle lamp box))   ; Lamp is on desk, not in box
    )
    (:goal (and (atLocation agent box)))
)