module tb_wire4();
    logic a, b, c;
    logic w, x, y, z;

    initial begin
        $dumpfile("tb_wire4.vcd");
        $dumpvars(0, tb_wire4);
    end

    wire4 dut (
        .a(a),
        .b(b),
        .c(c),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        $display("a b c | w x y z");

        for (int i = 0; i < 8; i++) begin
            {a, b, c} = i;
            #10;

            $display("%b %b %b | %b %b %b %b", a, b, c, w, x, y, z);

            if ((w !== a) || (x !== b) || (y !== b) || (z !== c)) begin
                $display("ERROR: mismatch at input %3b -> expected w=%b x=%b y=%b z=%b, got w=%b x=%b y=%b z=%b",
                         {a, b, c}, a, b, b, c, w, x, y, z);
                $fatal(1, "wire4 functional check failed");
            end
        end

        $display("All tests passed.");
        $finish;
    end
endmodule