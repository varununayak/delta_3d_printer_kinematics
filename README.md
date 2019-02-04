# delta_3d_printer_kinematics
Design, modelling, inverse kinematics analysis and simulation of a delta-configuration 3D printer

The MATLAB files contain the inverse kinematics solver and the workspace generator (as a 2D plot) for a 3-DoF delta configuration parallel manipulator. Joint limits, link lengths and other parameters can be varied
The 'deltaprinter.m' file performs the inverse kinematics computations on the X,Y,Z positions and produces the required joint variable values. The 'workspace.m' file calls this file to plot the workspace of the 3DPrinter.

The SolidWorks part files can be used to visualize the motion of such a parallel mechanism. Open the DeltaPrinterAssembly.SLDASM file in the folder to access the complete assembly of the mechanism.
