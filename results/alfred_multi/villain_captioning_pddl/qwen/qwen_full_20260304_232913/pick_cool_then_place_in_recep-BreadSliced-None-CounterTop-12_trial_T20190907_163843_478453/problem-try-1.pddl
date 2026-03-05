(define (problem cut_bread_and_refrigerate)
    (:domain put_task)
    (:objects
        robot - agent
        bread - object
        apple - object
        knife - object
        fridge - fridge
        countertop - object  ; not a receptacle in domain, but used for location
        toaster - object
        stove - object
        potato - object
        lettuce - object
        spoon - object
        container1 - object
        container2 - object
        frying_pan - object
    )
    (:init
        ; Locations: objects are on countertop or stove
        (atLocation robot countertop)  ; robot starts at countertop for accessibility
        (atLocation bread countertop)
        (atLocation apple countertop)
        (atLocation knife countertop)
        (atLocation fridge countertop)  ; fridge is adjacent to countertop area
        (atLocation toaster countertop)
        (atLocation stove countertop)
        (atLocation potato countertop)
        (atLocation lettuce countertop)
        (atLocation spoon countertop)
        (atLocation container1 countertop)
        (atLocation container2 countertop)
        (atLocation frying_pan stove)

        ; Receptacle properties
        (openable fridge)
        (not (opened fridge))

        ; Object states
        (not (isSliced bread))
        (not (isCool bread))
        (not (holdsAny robot))
        (not (holds robot bread))
        (not (holds robot knife))
        (not (inReceptacle bread fridge))
        (not (isToggled toaster))
        (not (isOn stove))
        (not (isClean bread))
        (not (isHot bread))
    )
    (:goal (and
        (atLocation bread countertop)
        (atLocation apple countertop)
        (isSliced bread)
        (not (inReceptacle bread fridge))  ; bread removed from fridge
        ; Place bread next to apple (proximity implied by both on countertop and task completion)
    ))
)