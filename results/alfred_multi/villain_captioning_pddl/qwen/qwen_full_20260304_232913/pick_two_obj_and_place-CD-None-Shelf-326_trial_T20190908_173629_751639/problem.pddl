(define (problem move_disks_to_shelf)
    (:domain put_task)
    (:objects
        agent1 - agent
        disc1 disc2 - object
        desk_shelf - receptacle
        desk_surface - object
    )
    (:init
        (atLocation agent1 desk_surface)
        (not (holdsAny agent1))
        (not (inReceptacle disc1 desk_shelf))
        (not (inReceptacle disc2 desk_shelf))
        (not (holds agent1 disc1))
        (not (holds agent1 disc2))
    )
    (:goal (and
        (inReceptacle disc1 desk_shelf)
        (inReceptacle disc2 desk_shelf)
    ))
)