import turtle

# Create a screen object
screen = turtle.Screen()

# Keeps track of which keys are currently being pressed
keys_state = {
    "w": False,
    "a": False,
    "s": False,
    "d": False
}

def update_keys():
    # Print the current state of all tracked keys
    pressed_keys = [key for key, pressed in keys_state.items() if pressed]
    print(f"Keys currently pressed: {pressed_keys}")

def press_w():
    keys_state["w"] = True
    update_keys()

def release_w():
    keys_state["w"] = False
    update_keys()

def press_a():
    keys_state["a"] = True
    update_keys()

def release_a():
    keys_state["a"] = False
    update_keys()

def press_s():
    keys_state["s"] = True
    update_keys()

def release_s():
    keys_state["s"] = False
    update_keys()

def press_d():
    keys_state["d"] = True
    update_keys()

def release_d():
    keys_state["d"] = False
    update_keys()

# Bind keypress and key release events
screen.listen()
screen.onkeypress(press_w, "w")
screen.onkeyrelease(release_w, "w")
screen.onkeypress(press_a, "a")
screen.onkeyrelease(release_a, "a")
screen.onkeypress(press_s, "s")
screen.onkeyrelease(release_s, "s")
screen.onkeypress(press_d, "d")
screen.onkeyrelease(release_d, "d")

# Keep the turtle graphics window open
turtle.mainloop()

