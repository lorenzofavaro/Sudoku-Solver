# Logic-Grid-Solver
This is a logic grid solver for a logic grid puzzle sent by my boss during a Christmas vacation from work.

He sent it to me thinking I would solved it by hand. I could have done it but we all know that time is precious. So I wrote a little program following [Answer Set Programming](https://en.wikipedia.org/wiki/Answer_set_programming) and had a lot of fun. To compute the answer sets it I used [clingo](https://github.com/potassco/clingo).


## Problem
<p align="center">
  <img src="https://github.com/lorenzofavaro/Sudoku-Solver/blob/main/docs/problem.png"/>
</p>


## Solution
```
clingo version 5.4.0
Reading from sudoku.cl
Solving...
Answer: 1
elem(iene,11,tommaso,a5) elem(coccodrilli,13,luca,a4) elem(tigri,12,paolo,b5) elem(bufali,9,antonio,b4) elem(leoni,10,maurizio,c4)
SATISFIABLE
Models       : 1
Calls        : 1
Time         : 0.166s (Solving: 0.04s 1st Model: 0.02s Unsat: 0.02s)
CPU Time     : 0.141s
```

Reported from the computation, the solution is then:
<p align="center">
  <img src="https://github.com/lorenzofavaro/Sudoku-Solver/blob/main/docs/solution.png"/>
</p>
