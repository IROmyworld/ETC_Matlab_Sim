# ETC System Simulation
These programs were built to aid the design decisions of an Electornic Throttle Control (ETC). More of this can be found on my [website](https://iroprojects.com/design-validation-of-custom-electronic-throttle-body/).

## Contents
*ETCdesignforpublishing.slx* is a [Simulink model](https://i0.wp.com/iroprojects.com/wp-content/uploads/2022/02/Screenshot-2022-02-06-at-19.00.17.png?w=1320) 
for an ETC it is built on Simscape. Uses PID based position control to control the opening of
a well defined throttle body actuated by a dc motor

*motorplot.m* is a matlab script that plots brushed dc motor [characteristic curves](https://iroprojects.com/wp-content/uploads/2022/02/Motor-Plotnl.tif). 
User can input known motor specs to plot their chosen motor or plot the RE-385 curves.

*AddAxisLeft.m* is a modified script of the matlab/addaxis addon that plots an axis on the left of the plot.
