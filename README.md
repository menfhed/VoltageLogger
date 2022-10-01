#############################################
# Logging the state of the mains voltage #
#############################################

Logging voltage changes with
UPS + networkupstools/nut.

* What is he doing?

Voltage logging system.
After starting, the voltage is monitored.
If the voltage has changed, a log entry will be made.

* How to use?

NUT must be installed and configured on the system.
The logger uses his data.
Run

> make

 and run

> ./monitor

To read all UPS status run:

>make test
> ./test

* Building dependency graph
After the logger has worked for some time,
you can run a script to plot the voltage change.
The graph is saved in png format with the log name.
The script uses gnuplot.

> http://www.networkupstools.org/ | networkupstools/nut
