function h = hessf3(x)
h = [-400*(x(2)-(3*x(1).^2)),-400*x(1);-200*x(1),200];