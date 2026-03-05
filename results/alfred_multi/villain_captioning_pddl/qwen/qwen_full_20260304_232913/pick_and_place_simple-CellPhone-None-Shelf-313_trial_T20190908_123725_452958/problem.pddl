(define (problem move_phone_to_shelf)
    (:domain put_task)
    (:objects
        agent1 - agent
        end_table - receptacle
        phone - object
        cd_player - object
        cd1 - object
        cd2 - object
        bookshelf - object
    )
    (:init
        (atLocation agent1 end_table) ; Agent starts at end table for simplicity, as per common planning assumption; if not, a GotoLocation to end_table would be first step.
        (openable end_table)
        (not (opened end_table)) ; Assuming shelf needs to be "opened" even if physically open, per domain requirement.
        (not (holdsAny agent1))
        (not (inReceptacle phone end_table))
        (not (isClean phone))
        (not (isHot phone))
        (not (isCool phone))
        (not (isSliced phone))
        (not (isToggled phone))
        ; Phone is on top of end table, not in shelf. We model this as not inReceptacle and atLocation agent1 end_table implies proximity.
    )
    (:goal (and
        (inReceptacle phone end_table)
        (not (holdsAny agent1))
    ))
)