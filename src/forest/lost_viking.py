# You MUST click on the HELP button to see a detailed description of this level!

# The raven will tell you what to use for your maze parameters!
SLIDE = 9
SWITCH = 5
SKIP = 7

# Set up boolean variables switch and skip to toggle conditions.
switch = False
skip = False

# How many sideSteps north of the Red X you've taken.
sideSteps = 1

# How many steps east of the Red X you've taken.
steps = 1

# Multiply this with steps to determine your X coordinate. DON'T CHANGE THIS!
X_PACE_LENGTH = 4

# Multiply this with sideSteps to determine your Y coordinate. DON'T CHANGE THIS!
Y_PACE_LENGTH = 6

# The maze is 35 steps along the X axis.
while (steps <= 35):
    # Take the next step:
    self.moveXY(steps * X_PACE_LENGTH, sideSteps * Y_PACE_LENGTH)
    
    # Increment steps and sideSteps as appropriate, taking into account the special rules.
    steps = steps + 1
    
    # Toggle switching and skipping of sideSteps.
    if (not switch):
        if (not skip):
            sideSteps = sideSteps + 1
        else:
            sideSteps = sideSteps + 2
            skip = not skip # Turn off skip if skip is on.
        
    elif (switch):
        if (not skip):
            sideSteps = sideSteps - 1
        else:
            sideSteps = sideSteps - 2
            skip = not skip
        
    

    # Make the conditions for SWITCH and SKIPping here.
    # If steps are divisible by the SWITCH, then sideStep in oppo direction.
    # If steps are divisible by the SKIP, then sideStep twice.
    if (steps % SWITCH == 0):
        switch = not switch
    elif (steps % SKIP == 0):
        skip = not skip
    
    # Make cases for any sideSteps taken.
    # If sideSteps are over SLIDE, then wrap back to 1. For sideSteps below 1, go back to SLIDE.
    if (sideSteps > SLIDE):
        sideSteps = 1
    elif (sideSteps < 1):
        sideSteps = SLIDE
