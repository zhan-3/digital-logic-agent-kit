module adder_8 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic       cin,
    output logic [7:0] s,
    output logic       cout
);
    assign {cout,s} = a + b + cin;
endmodule