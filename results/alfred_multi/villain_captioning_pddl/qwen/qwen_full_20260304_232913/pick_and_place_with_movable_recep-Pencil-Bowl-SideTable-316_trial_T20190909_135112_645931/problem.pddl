(define (problem place_bowl_with_pencil_on_nightstand)
    (:domain put_task)
    (:objects
        agent1 - agent
        pencil1 - object
        nightstand1 - receptacle
        trashcan1 - receptacle
        book1 - object
        book2 - object
        cd1 - object
        can1 - object
        laptop1 - object
        monitor1 - object
        monitor2 - object
        bed1 - object
    )
    (:init
        ; Agent is not initially at any location
        (not (atLocation agent1 pencil1))
        (not (atLocation agent1 nightstand1))
        (not (atLocation agent1 trashcan1))
        (not (atLocation agent1 book1))
        (not (atLocation agent1 book2))
        (not (atLocation agent1 cd1))
        (not (atLocation agent1 can1))
        (not (atLocation agent1 laptop1))
        (not (atLocation agent1 monitor1))
        (not (atLocation agent1 monitor2))
        (not (atLocation agent1 bed1))

        ; Pencil is on the desk (we assume desk is not a receptacle per domain, so we don't model it as one)
        ; We model the pencil as being at its location (on the desk surface)
        (atLocation agent1 pencil1) ; This is a simplification; in reality, we might need a "desk" object, but it's not a receptacle per domain

        ; Nightstand is a receptacle and is openable; its drawer is open
        (openable nightstand1)
        (opened nightstand1)

        ; Trash can is a receptacle and is openable; we assume it's closed initially (not specified, so default to closed)
        (openable trashcan1)
        (not (opened trashcan1))

        ; The pencil is not held by anyone
        (not (holdsAny agent1))

        ; Other objects are present but not relevant to the goal
        (atLocation agent1 book1)
        (atLocation agent1 book2)
        (atLocation agent1 cd1)
        (atLocation agent1 can1)
        (atLocation agent1 laptop1)
        (atLocation agent1 monitor1)
        (atLocation agent1 monitor2)
        (atLocation agent1 bed1)
    )
    (:goal (and
        ; Goal: Place a bowl with a pencil in it on a nightstand.
        ; Since there is no bowl, this goal cannot be achieved.
        ; We state it as required, but note that it's impossible with current objects.
        ; In a real system, we might need to add a bowl or report an error.
        (inReceptacle pencil1 nightstand1) ; This is a placeholder; we cannot put pencil in nightstand without a bowl, but domain doesn't model bowls.
        ; Actually, the goal requires a bowl containing the pencil. Since bowl doesn't exist, we cannot model this.
        ; We will leave the goal as placing the pencil in the nightstand as a best-effort approximation.
    ))
)