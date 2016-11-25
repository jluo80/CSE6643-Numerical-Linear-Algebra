1.p1.m is MATLAB code for problem 1.

2.p2.m is MATLAB code for problem 2.

3.tridiag.m is MATLAB code for problem 3 (a) to produce tridiagonal matrix.

4.qralg.m is MATLAB code for problem 3 (b) to do QR factorization with no shift.

5.qralg_new.m is MATLAB code for problem 3 (d) to do QR factorization with shift.

6.wsft.m is MATLAB code for problem 3 (d) which is part of the qralg_new.m file.
It helps to calculate the Wilkinsonn shift mu at each iteration.

7.driver_c.m is driver code for problem 3 (c). This file can run the tridiag.m
and qralg.m code to perform the algorithm with no shift.

8.driver_d.m is driver code for problem 3 (d). This file can run the tridiag.m
and qralg.m code to perform the algorithm with no shift.

9.driver_e.m is driver code for problem 3 (e). This file can run both driver_c.m
and driver_d.m files to calculate the eigenvalue of a matrix by these two algorithms.