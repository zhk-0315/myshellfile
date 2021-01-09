#! /bin/bash

rfkill unblock wifi
ifconfig wls0p up
iwctl

