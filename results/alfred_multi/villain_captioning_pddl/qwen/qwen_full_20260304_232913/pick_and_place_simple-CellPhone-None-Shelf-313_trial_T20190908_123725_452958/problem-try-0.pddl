(define (problem move_phone_to_shelf)
    (:domain put_task)
    (:objects
        agent1 - agent
        end_table - receptacle
        cd_player - object
        cd1 - object
        cd2 - object
    )
    (:init
        (openable end_table)
        (opened end_table)
        (atLocation agent1 end_table)
        (not (holdsAny agent1))
        (not (isOn cd_player))
        (not (isToggled cd_player))
        (not (inReceptacle cd_player end_table))
        (not (inReceptacle cd1 end_table))
        (not (inReceptacle cd2 end_table))
        (inReceptacle cd_player end_table) ; Correction: CD player is on top of end table, which is a receptacle surface, but domain doesn't model "on top" vs "in shelf". We'll treat top surface as not "inReceptacle" for the shelf.
        ; Actually, per domain, "inReceptacle" means inside the receptacle (shelf). Since CD player is on top, not in shelf, it should be not inReceptacle.
        ; Let's correct: CD player is not in the shelf, so not inReceptacle. It is atLocation end_table.
        ; We'll remove the above line and add:
        (atLocation cd_player end_table)
        (atLocation cd1 end_table)
        (atLocation cd2 end_table)
        ; Since the shelf is open and empty, no objects are in it.
        (not (inReceptacle cd_player end_table))
        (not (inReceptacle cd1 end_table))
        (not (inReceptacle cd2 end_table))
    )
    (:goal (and
        (inReceptacle cd_player end_table)
    ))
)