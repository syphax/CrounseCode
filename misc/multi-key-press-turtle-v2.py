from turtle import Turtle, Screen

win = Screen()

flynn = Turtle('turtle')

def process_events():
    events = tuple(sorted(key_events))

    if events and events in key_event_handlers:
        (key_event_handlers[events])()

    key_events.clear()

    win.ontimer(process_events, 200)

def Up():
    key_events.add('UP')

def Down():
    key_events.add('DOWN')

def Left():
    key_events.add('LEFT')

def Right():
    key_events.add('RIGHT')

def move_up():
    flynn.setheading(90)
    flynn.forward(25)
    
