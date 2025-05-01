(define (domain blocksworld)
    (:requirements :strips)
    (:types block robot)
    
    (:predicates
        (clear ?x - block)
        (on ?x - block ?y - block)
        (ontable ?x - block)
        (holding ?x - block ?r - robot)
        (handempty ?r - robot)
    )
    
    (:action pick-up
        :parameters (?x - block ?r - robot)
        :precondition (and (clear ?x) (ontable ?x) (handempty ?r))
        :effect (and (holding ?x ?r)
                     (not (ontable ?x))
                     (not (clear ?x))
                     (not (handempty ?r)))
    )
    
    (:action put-down
        :parameters (?x - block ?r - robot)
        :precondition (holding ?x ?r)
        :effect (and (ontable ?x)
                     (clear ?x)
                     (handempty ?r)
                     (not (holding ?x ?r)))
    )
    
    (:action stack
        :parameters (?x - block ?y - block ?r - robot)
        :precondition (and (holding ?x ?r) (clear ?y))
        :effect (and (on ?x ?y)
                     (clear ?x)
                     (handempty ?r)
                     (not (holding ?x ?r))
                     (not (clear ?y)))
    )
    
    (:action unstack
        :parameters (?x - block ?y - block ?r - robot)
        :precondition (and (on ?x ?y) (clear ?x) (handempty ?r))
        :effect (and (holding ?x ?r)
                     (clear ?y)
                     (not (on ?x ?y))
                     (not (clear ?x))
                     (not (handempty ?r)))
    )
)