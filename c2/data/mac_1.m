function [A,b] = mac_1

A = [ 
    1 0 -1 0 0 0 0
    -1 1 1 0 0 0 0
    0 -1 2 -1 0 0 0
    0 -1 0 2 0 1 0
    0 -1 -1 0 2 1 1
    0 0 1 -1 0 2 -1  
    0 0 0 -1 1 -1 2
];

b = [0 0 0 0 0 20 0]';