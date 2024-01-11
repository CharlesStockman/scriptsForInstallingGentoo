#
# Select the profile -- Get the number from "eselect profile list"
#
eselect profile set 15

#
#  Command line options
#    --ask       display the action(s) and  ask for permission .  We cannot use this since it is automated
#    --update    update to the best  version possible which may not be the highest  ( due to masking testing and development )
#    --update    well know
#    --deep      checks all dependencies as well
#    --newuse    tell ermage to include packages where the use flags have changed.
emerge --verbose --update --deep --newuse @world
