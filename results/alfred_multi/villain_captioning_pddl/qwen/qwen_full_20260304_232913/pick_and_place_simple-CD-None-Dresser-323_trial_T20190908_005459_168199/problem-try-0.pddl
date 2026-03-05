(define (problem move_cd_to_dresser)
    (:domain put_task)
    (:objects
        robot - agent
        desk - object
        dresser - receptacle
        cd1 - object
        cd2 - object
        mug1 - object
        mug2 - object
        bowl - receptacle
        smartphone - object
        digital_device - object
        book_stack - object
        lamp - object
    )
    (:init
        ; Initial locations: all objects are on the desk except the book on dresser
        (atLocation robot desk)
        (inReceptacle cd1 desk)
        (inReceptacle cd2 desk)
        (inReceptacle mug1 desk)
        (inReceptacle mug2 desk)
        (inReceptacle bowl desk)
        (inReceptacle smartphone desk)
        (inReceptacle digital_device desk)
        (inReceptacle book_stack desk)
        (inReceptacle lamp desk)
        ; The dresser is a receptacle and has a book on it
        (inReceptacle book_on_dresser dresser)
        ; No object is held
        (not (holdsAny robot))
        ; No object is clean, hot, cool, sliced, or toggled
        (not (isClean cd1))
        (not (isClean cd2))
        (not (isHot cd1))
        (not (isHot cd2))
        (not (isCool cd1))
        (not (isCool cd2))
        (not (isSliced cd1))
        (not (isSliced cd2))
        (not (isToggled cd1))
        (not (isToggled cd2))
        ; The dresser is not openable (it's a surface, not a container)
        (not (openable dresser))
        ; The bowl is openable (as it's a container-like object)
        (openable bowl)
        (not (opened bowl))
        ; The lamp is on (though not in domain predicates, we don't need to model it)
        ; We assume the robot starts at the desk
        (atLocation robot desk)
    )
    (:goal (and
        ; One of the CDs should be on the dresser
        (inReceptacle cd1 dresser)
        ; The other CD remains on the desk (optional, but implied by moving only one)
        (inReceptacle cd2 desk)
    ))
)