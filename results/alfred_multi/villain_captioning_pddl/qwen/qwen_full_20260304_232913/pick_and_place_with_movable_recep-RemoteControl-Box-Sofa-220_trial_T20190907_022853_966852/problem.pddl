(define (problem put_box_with_remote_on_couch)
    (:domain put_task)
    (:objects
        robot - agent
        couch - receptacle
        box - receptacle
        remote - object
        coffee_table - object
    )
    (:init
        (atLocation robot coffee_table) ; robot starts at coffee table
        (inReceptacle box coffee_table) ; box is on coffee table
        (inReceptacle remote coffee_table) ; remote is on coffee table
        (openable box) ; box is openable (and visually open)
        (opened box) ; box is already open
        (not (holdsAny robot)) ; robot is not holding anything
        (not (inReceptacle remote box)) ; remote is not in box
        (not (inReceptacle box couch)) ; box is not on couch
        (not (opened couch)) ; couch is not opened (though it doesn't need to be for this task)
    )
    (:goal
        (and
            (inReceptacle remote box) ; remote is inside the box
            (inReceptacle box couch) ; box (with remote) is on the couch
        )
    )
)